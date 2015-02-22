# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libctru
pkgver=0.4.0
pkgrel=1
pkgdesc="Library for Nintendo 3DS homebrew development"
arch=('any')
url="http://www.devkitpro.org"
license=('custom: zlib')
depends=('devkitarm')
source=($pkgname-$pkgver.tar.gz::"https://github.com/smealum/ctrulib/archive/v$pkgver.tar.gz")
sha256sums=('a16fd5778158eaf02a67f9cd7b1d46b2496dde4e606cfd66929330ae91738ba2')
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
  sed '/license/,$!d' README.md > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
