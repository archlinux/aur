# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=espeak-ng
pkgver=1.51.1
pkgrel=3
pkgdesc='Multi-lingual software speech synthesizer'
url=https://github.com/espeak-ng/espeak-ng
arch=('x86_64')
license=('GPL3')
depends=('pcaudiolib' 'libsonic')
#checkdepends=('python')
makedepends=('ruby-ronn-ng')
replaces=('espeak-ng-espeak')
provides=('espeak-ng-espeak')
conflicts=('espeak-ng-espeak' 'espeak')
source=("$url/archive/$pkgver/espeak-ng-$pkgver.tar.gz")
b2sums=('7b5a9d0613636942374b2b414fa5cffcbefe18083dc9aa79a6ac08cc3737cbef06808bf90f0c846ec33acf481797329fb6d2f013b6f67abd6a2dfcda0d3f9343')

prepare() {
  cd espeak-ng-$pkgver
  ./autogen.sh
}


build() {
  cd espeak-ng-$pkgver
  ./configure --prefix=/usr
  make src/espeak-ng src/speak-ng
  make
}

#check() {
#  cd espeak-ng-$pkgver
#  make -j1 check
#}

package() {
  cd espeak-ng-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/vim/{addons,vimfiles}
  rm -r "$pkgdir"/usr/{include/espeak,share/vim/registry}
}

# vim:set ts=2 sw=2 et:
