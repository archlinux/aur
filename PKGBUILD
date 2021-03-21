pkgname=libcamera-git
pkgver=r2416.1a26f79f
pkgrel=1
pkgdesc='A complex camera support library for Linux, Android, and ChromeOS'
arch=('x86_64' 'i686')
url='http://libcamera.org/'
makedepends=(
    "gcc"
    "gnutls"
    "openssl"
    "meson"
    "python-yaml"
    "python-ply"
    "python-jinja"
)
optdepends=(
    "boost"
    "udev"
    "python-sphinx"
    "doxygen"
    "graphviz"
    "gstreamer"
    "libevent"
    "qt5-base"
    "qt5-tools"
    "libtiff"
)
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
    meson build --prefix /usr -Dwerror=false
    ninja -C build
}

package() {
    cd "$srcdir/libcamera"
    DESTDIR="${pkgdir}" ninja -C build install
    rm -rf "$pkgdir/usr/share/doc/libcamera-0.0.0/html/.doctrees/"
}
