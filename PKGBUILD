# Maintainer: Nicola Revelant <nicolarevelant44@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>

pkgname=basket
_pkgver=2.49
pkgver=${_pkgver}b
pkgrel=8
pkgdesc="All-purpose notes taker"
arch=('x86_64')
url="https://basket-notepads.github.io/"
depends=('kcmutils' 'kfilemetadata' 'kparts' 'phonon-qt5' 'libgit2')
makedepends=('extra-cmake-modules' 'kdoctools')
license=('GPL')
source=(https://launchpad.net/basket/kde5/$pkgver/+download/basket-$_pkgver-beta.tar.bz2
        basket-libgit2-0.99.patch::"https://invent.kde.org/utilities/basket/-/commit/090ac469.patch")
sha256sums=('e760fc68deb1f56ef02cd4a1773c6cd348b79b88ef5ff5dfb05e66947244f186'
            '28437b7833806ecbef9ae62429d96ee20216c37eaba352a40e6b98949c6abcf0')

prepare() {
	patch -d $pkgname-$_pkgver-beta -p1 < basket-libgit2-0.99.patch # Fix build with libgit 0.99
}

build() {
	cmake -B build -S $pkgname-$_pkgver-beta -DBUILD_TESTING=OFF
	cmake --build build -- -j8
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
