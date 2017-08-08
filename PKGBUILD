# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libctru
pkgver=1.3.0
pkgrel=1
pkgdesc="Library for Nintendo 3DS (CTR) homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom: zlib')
depends=('devkitarm')
source=($pkgname-$pkgver.tar.gz::"https://github.com/smealum/ctrulib/archive/v$pkgver.tar.gz")
sha256sums=('320f4fd04654d40484a719b7cba69350107520e1aa42ca0daff00f03bbf53362')
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
