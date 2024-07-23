# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=espeak-ng
pkgver=1.51.1
pkgrel=4
pkgdesc='Multi-lingual software speech synthesizer'
url=https://github.com/espeak-ng/espeak-ng
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  pcaudiolib
  libsonic
)
#checkdepends=(python)
makedepends=(
  git
  ruby-ronn-ng
)
replaces=(espeak-ng-espeak)
provides=(espeak-ng-espeak)
conflicts=(
  espeak-ng-espeak
  espeak
)
source=("git+$url.git#tag=$pkgver")
b2sums=('4095798ad873282403226f8c28208f3b0ab3d5d0883678d88f63b9a4c5312c9c31fcf5c4355d5f0083b4635d5326aeceaa631d5fb4eb1b7c8ba388e410f57307')

prepare() {
  cd $pkgname
  ./autogen.sh
}


build() {
  cd $pkgname
  ./configure --prefix=/usr
  make src/espeak-ng src/speak-ng
  make
}

#check() {
#  cd $pkgname
#  make -j1 check
#}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/vim/{addons,vimfiles}
  rm -r "$pkgdir"/usr/{include/espeak,share/vim/registry}
}

# vim:set ts=2 sw=2 et:
