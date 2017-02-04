# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libctru
pkgver=1.2.0
pkgrel=1
pkgdesc="Library for Nintendo 3DS (CTR) homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom: zlib')
depends=('devkitarm')
source=($pkgname-$pkgver.tar.gz::"https://github.com/smealum/ctrulib/archive/v$pkgver.tar.gz")
sha256sums=('8f49f03a81a3cf2cc234eef8150c70584a8e21bcb17b6abf868c6be33f888fe6')
options=(!strip staticlibs)

build() {
  # set environment
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
