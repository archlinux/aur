# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('qt5-styleplugins')
_srcname='qtstyleplugins'
pkgdesc='Additional style plugins for Qt5'
pkgver='5.0.0'
_commit='84b443109729664c7a0bd124b42c493f28069efc'
pkgrel='10'
arch=('i686' 'x86_64')
url="https://code.qt.io/cgit/qt/${_srcname}"
license=('LGPL')

depends=('qt5-base' 'gtk2' 'libx11')
makedepends=('git')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+https://code.qt.io/qt/${_srcname}.git#commit=${_commit}")
sha512sums=('SKIP')

install='install.sh'

build() {
    cd "${srcdir}/${_srcname}"

    qmake PREFIX='/usr' \
        LIBDIR='/usr/lib' \
        QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
        QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"
    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make INSTALL_ROOT="${pkgdir}" install
}
