# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=espeak-ng
pkgver=1.49.2
pkgrel=5
pkgdesc='Multi-lingual software speech synthesizer'
url=https://github.com/espeak-ng/espeak-ng
arch=('x86_64')
license=('GPL3')
depends=('pcaudiolib')
makedepends=('ruby-ronn')
conflicts=('espeak')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('521220113cb4e2a4a03e29f2c0edad6239170fec95ba67077ccae46d32167f6b72b7a357d73e48abf21fdb0334bf9f010ee1b8325f6520ec4893c48f2a2676ca')

prepare() {
  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make src/espeak-ng src/speak-ng
  make -j1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
