# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=sandsmark-notificationd-git
pkgver=29.d5e8cd9
pkgrel=1
pkgdesc="simple notification daemon because everything else sucks"
arch=(i686 x86_64)
url="https://github.com/sandsmark/sandsmark-notificationd"
license=(GPL3)
depends=(qt5-base)
makedepends=(git cmake)
provides=(sandsmark-notificationd)
conflicts=(sandsmark-notificationd)
source=('git+https://github.com/sandsmark/sandsmark-notificationd.git')
md5sums=('SKIP')

pkgver() {
    cd sandsmark-notificationd
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
        cmake ../sandsmark-notificationd \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
