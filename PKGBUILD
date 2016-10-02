pkgname=('qt5-styleplugins')
_srcname='qtstyleplugins'
pkgdesc='Additional style plugins for Qt5'
pkgver='5.0.0'
pkgrel='2'
arch=('i686' 'x86_64')
url="https://code.qt.io/cgit/qt/${_srcname}"
license=('LGPL')

depends=('qt5-base' 'gtk2' 'libx11')
makedepends=('git')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=(
    "${_srcname}::git+${url}.git#commit=7b11d50ac5eb0f9f069d0c73ada5796eac584217"
    'gconf.patch'
)
sha512sums=(
    'SKIP'
    'SKIP'
)

prepare() {
    cd "${srcdir}/${_srcname}"

    git apply "${srcdir}/gconf.patch"
}

build() {
    cd "${srcdir}/${_srcname}"

    qmake PREFIX='/usr' LIBDIR='/usr/lib'
    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make INSTALL_ROOT="${pkgdir}" install
    rm --recursive "${pkgdir}/usr/lib/cmake"
}
