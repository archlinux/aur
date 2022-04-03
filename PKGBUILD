# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=espeak-ng
pkgver=1.51
pkgrel=1
pkgdesc='Multi-lingual software speech synthesizer'
url=https://github.com/espeak-ng/espeak-ng
arch=('x86_64')
license=('GPL3')
depends=('pcaudiolib')
makedepends=('pcaudiolib' 'ruby-ronn-ng')
replaces=('espeak-ng-espeak')
provides=('espeak-ng-espeak')
conflicts=('espeak-ng-espeak' 'espeak')
options=(debug)
source=("$url/archive/$pkgver/espeak-ng-$pkgver.tar.gz")
b2sums=('230e8860247bdd44a26ba7281fadb7486e7fff90de229c71fb883693badfc141d5ad883769d6cead150f43560a5c47152cada4fcb5a28c0b0384dacaad2c9d09')

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

package() {
  cd espeak-ng-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/vim/{addons,vimfiles}
  rm -r "$pkgdir"/usr/{include/espeak,share/vim/registry}
}

# vim:set ts=2 sw=2 et:
