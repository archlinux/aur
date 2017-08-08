# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=citro3d
pkgver=1.3.0
pkgrel=1
pkgdesc="Library providing a stateful interface to the PICA200 GPU of the Nintendo 3DS (CTR) for homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom: zlib')
depends=('libctru')
source=($pkgname-$pkgver.tar.gz::"https://github.com/fincs/citro3d/archive/v$pkgver.tar.gz")
sha256sums=('5996ac923e3c913ee90fb2efafcff461f67f503723b078c1107c760a30341f93')
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
