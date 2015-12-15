# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libctru
pkgver=1.0.0
pkgrel=1
pkgdesc="Library for Nintendo 3DS homebrew development"
arch=('any')
url="http://www.devkitpro.org"
license=('custom: zlib')
depends=('devkitarm')
source=($pkgname-$pkgver.tar.gz::"https://github.com/smealum/ctrulib/archive/v$pkgver.tar.gz")
sha256sums=('13ecd1d308e54400ff381e57050d56c76ae1a30fc3792503ab4ea183bf420624')
options=(!strip staticlibs)

build() {
  source /etc/profile.d/devkitarm.sh
  make -C ctrulib-$pkgver/libctru
}

package() {
  cd ctrulib-$pkgver

  export DEVKITPRO="$pkgdir/opt/devkitpro"
  make -C libctru install

  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  sed '/# License/,$!d' README.md > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
