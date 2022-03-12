# Maintainer: Douglas Creager <dcreager@dcreager.net>

pkgname=pine64-rkdeveloptool-git
_pkgname=${pkgname#pine64-}
_pkgname=${_pkgname%-git}
pkgver=1.1.0
pkgrel=1
pkgdesc='fastboot-like CLI tool for flashing rockchip devices, forked to support the PineNote and Quartz64 as well as other Pine64 RK devices'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://gitlab.com/pine64-org/quartz-bsp/rkdeveloptool'
license=('GPL2')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git' 'scdoc')
depends=('libusb')
source=('git+https://gitlab.com/pine64-org/quartz-bsp/rkdeveloptool.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "$srcdir/$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
