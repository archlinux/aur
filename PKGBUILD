# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=espeak-ng
pkgver=1.50
pkgrel=1
pkgdesc='Multi-lingual software speech synthesizer'
url=https://github.com/espeak-ng/espeak-ng
arch=('x86_64')
license=('GPL3')
depends=('pcaudiolib')
makedepends=('ruby-ronn')
conflicts=('espeak')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('297dd80a6cdae3e2b8acf6823475220ce89d6a5fb68ea303156ad52cb3e7388049b6921759d4ed4e3d2e2ebd19bf931259e454f74a2ac0b7ecf4ce56c1d60c0c')

prepare() {
  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-extdict-{ru,zh,zhy}
  make src/espeak-ng src/speak-ng
  make -j1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
