# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng-git
pkgver=v0.3.1.r2.gf77e500
pkgrel=1
pkgdesc="C library for reading and writing PNG format files with a focus on security and ease of use"
arch=(i686 x86_64 armv6h armv7h)
url="https://libspng.org/"
license=('BSD')
depends=(zlib)
makedepends=(git meson)
#checkdepends=(libpng)
provides=(libspng)
conflicts=(libspng)
source=("git+https://gitlab.com/randy408/libspng.git")
md5sums=(SKIP)

pkgver() {
    cd libspng
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd libspng
    rm -rf build
    arch-meson build
    ninja -C build
}

#check() {
#    cd libspng
#    meson configure -Ddev_build=true build
#    ninja test -C build
#}

package() {
    cd libspng
    DESTDIR="${pkgdir}/" ninja -C build install
    
    install -D LICENSE "${pkgdir}/usr/share/licenses/libspng/LICENSE"
}
