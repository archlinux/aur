# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=callaudiod
pkgver=0.0.4
pkgrel=1
pkgdesc="Call audio routing daemon"
arch=(i686 x86_64 armv7h aarch64)
url="https://gitlab.com/mobian1/callaudiod"
license=(GPL3)
depends=(alsa-lib glib2 libpulse)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/callaudiod-${pkgver}.tar.gz")
sha256sums=('a9620dee2999fa85a7ca8f0314be3317a99fc225439ac193d5f727ff9397f93d')

prepare() {
    ln -s ../src/callaudiod.h callaudiod-${pkgver}/libcallaudio/callaudiod.h
}

build() {
    arch-meson callaudiod-${pkgver} build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
}
