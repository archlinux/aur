# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng-git
pkgver=0.6.2.r2.g1cf2b38
pkgrel=1
pkgdesc="C library for reading and writing PNG format files with a focus on security and ease of use"
arch=(i686 x86_64 armv7h aarch64)
url="https://libspng.org/"
license=('BSD')
depends=(zlib)
makedepends=(git meson)
checkdepends=(libpng)
provides=(libspng)
conflicts=(libspng)
source=("git+https://gitlab.com/randy408/libspng.git")
md5sums=(SKIP)

pkgver() {
    cd libspng
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson build libspng
    ninja -C build
}

check() {
    cd build
    meson configure -Ddev_build=true
    ninja test
}

package() {
    DESTDIR="${pkgdir}/" ninja -C build install
    install -D "libspng/LICENSE" "${pkgdir}/usr/share/licenses/libspng-git/LICENSE"
}
