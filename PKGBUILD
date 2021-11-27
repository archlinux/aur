# Maintainer: redtide <redtid3@gmail.com>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: huiyiqun <huiyiqun@gmail.com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

_pkgname=picom-conf
pkgname=${_pkgname}-git
pkgver=0.16.0.32.ga5fffef
pkgrel=1
pkgdesc="GUI configuration tool for Picom X composite manager"
arch=("i686" "x86_64")
url="https://github.com/redtide/picom-conf"
license=("LGPL2.1")

depends=("qt5-base>=5.12.0" "libconfig")
makedepends=("git" "cmake" "qt5-tools")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+https://github.com/redtide/picom-conf.git")
sha512sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags 2>/dev/null | sed -r "s/-/./g"
}
prepare() {
    mkdir -p "${srcdir}"/build
}
build() {
    cd "${srcdir}"/build
    cmake ../${_pkgname} \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}
package() {
    cd "${srcdir}"/build
    make DESTDIR="${pkgdir}" install
}
