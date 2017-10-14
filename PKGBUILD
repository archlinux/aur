# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=citro3d
pkgver=1.3.1
pkgrel=1
pkgdesc="Library providing a stateful interface to the PICA200 GPU of the Nintendo 3DS (CTR) for homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom: zlib')
depends=('libctru')
source=($pkgname-$pkgver.tar.gz::"https://github.com/fincs/citro3d/archive/v$pkgver.tar.gz")
sha256sums=('2f508fdbd80562bc06ed2f2d5764b093f859f1c7aeaab5b4970c1003ef81e554')
options=(!strip staticlibs)

build() {
  # set environment
  source /etc/profile.d/devkitarm.sh

  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver

  export DEVKITPRO="$pkgdir/opt/devkitpro"
  make install

  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  sed '/# License/,$!d' README.md > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
