pkgname="libcamera-git"
pkgver=r15.b99da21
pkgrel=1
pkgdesc='A complex camera support library for Linux, Android, and ChromeOS'
arch=('x86_64' 'i686')
url='http://libcamera.org/'
#depends=(')
makedepends=("meson")
license=('LGPL')
source=('git+https://git.linuxtv.org/libcamera.git/')
md5sums=('SKIP')

pkgver() {
  cd libcamera
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/libcamera"
    meson build --prefix /usr
    cd build
    ninja
}

package() {
    cd "$srcdir/libcamera/build"
    DESTDIR="${pkgdir}" ninja install
}
