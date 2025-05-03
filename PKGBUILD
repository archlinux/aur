# Maintainer: 2-4601 <AUR@othermemory.org>

_pkgname=libgbinder
pkgname="${_pkgname}-git"
pkgver=1.1.42.r3.ga700ddd
pkgrel=1
pkgdesc="GLib-style interface to binder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mer-hybris/libgbinder"
license=('BSD-3-Clause')
depends=(
    'glib2'
    'libglibutil'
)
makedepends=(
    'git'
)
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_pkgname}
    make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
    cd ${_pkgname}
    make install-dev DESTDIR="${pkgdir}"
}
