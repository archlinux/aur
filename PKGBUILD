pkgname=sandsmark-notificationd-git
pkgver=r16.7d33d87
pkgrel=1
pkgdesc="simple notification daemon because everything else sucks"
arch=(i686 x86_64)
url="https://github.com/sandsmark/sandsmark-notificationd"
license=(GPL3)
depends=(qt5-base)
makedepends=(git)
provides=(sandsmark-notificationd)
conflicts=(sandsmark-notificationd)
source=('git+https://github.com/sandsmark/sandsmark-notificationd.git')
md5sums=('SKIP')

pkgver() {
    cd sandsmark-notificationd
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
        cmake ../sandsmark-notificationd \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
