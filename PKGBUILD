# Maintainer: afontenot <adam.m.fontenot@gmail.com>
# Contributor: euler23 <jordanpaldino@gmail.com>

pkgname=libipuz
pkgver=0.5.1
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=(LGPL-2.1-or-later OR MIT)
depends=(json-glib)
makedepends=(glib2-devel meson rust)
source=("${url}/-/archive/${pkgver}/libipuz-${pkgver}.tar.gz")
sha256sums=('9eae2d361beaa3e3bf2252c5c22ecd9756381c6cf83ca91150f70ee919679df4')

build() {
    arch-meson "${pkgname}-${pkgver}" build --buildtype=release
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
