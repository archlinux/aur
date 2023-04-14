# Maintainer: Nicola Revelant <nicolarevelant44@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>

pkgname=basket
_pkgver=2.49
pkgver=${_pkgver}b
pkgrel=7
pkgdesc="All-purpose notes taker"
arch=('x86_64')
url="https://basket-notepads.github.io/"
depends=('kcmutils' 'kfilemetadata' 'kparts' 'phonon-qt5' 'libgit2')
makedepends=('extra-cmake-modules' 'kdoctools')
license=('GPL')
source=(https://launchpad.net/basket/kde5/$pkgver/+download/basket-$_pkgver-beta.tar.bz2
        basket-libgit2-0.99.patch::"https://invent.kde.org/utilities/basket/-/commit/090ac469.patch")
sha256sums=('e760fc68deb1f56ef02cd4a1773c6cd348b79b88ef5ff5dfb05e66947244f186'
            'd68cffcb4ab5227524763dd74f707ff8fae2e79121cf6f92c915cc8d8de9724d')

prepare() {
  patch -d $pkgname-$_pkgver-beta -p1 < basket-libgit2-0.99.patch # Fix build with libgit 0.99
}

build() {
  cmake -B build -S $pkgname-$_pkgver-beta \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
