pkgname=libcamera-git
pkgver=r2399.f5d3fa12
pkgrel=1
pkgdesc='A complex camera support library for Linux, Android, and ChromeOS'
arch=('x86_64' 'i686')
url='http://libcamera.org/'
makedepends=("meson" "python-yaml" "python-ply" "python-jinja")
license=('LGPL')
options=('!buildflags')
source=('git://linuxtv.org/libcamera.git/')
md5sums=('SKIP')

pkgver() {
    cd libcamera
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/libcamera"
    meson build --prefix /usr
    ninja -C build
}

package() {
    cd "$srcdir/libcamera"
    DESTDIR="${pkgdir}" ninja -C build install
    rm -rf "$pkgdir/usr/share/doc/libcamera-0.0.0/html/.doctrees/"
}
