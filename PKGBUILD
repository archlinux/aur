# Maintainer: Benjamin Bukowski <b at bkwsk dot de>
pkgname=krunner-firefox
pkgver=1.4.0
pkgrel=1
pkgdesc="Launch Firefox profiles from Krunner and your normal launcher."
arch=('x86_64')
url="https://github.com/alex1701c/krunner-firefox"
license=('GPL3')
depends=('firefox')
makedepends=('cmake' 'extra-cmake-modules' 'kcmutils')
optdepends=('proxychains-ng: Launch specific profiles over a proxy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alex1701c/$pkgname/archive/refs/tags/$pkgver.tar.gz" 'private_browsing_firefox.svg')
sha256sums=('3c9d4b6989f240d0613919ccc055386caa696348269fd8c96df0e828eac7bfe4'
            'fd7611210dc81105c6b8c92f77f332549f697c61efa6d5dd9e60eaff2dc8d067')

build() {
    cmake -B build -S $pkgname-$pkgver \
        -DBUILD_TESTING=OFF

    cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 private_browsing_firefox.svg -t $pkgdir/usr/share/pixmaps
}
