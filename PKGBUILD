pkgname=('qt5-styleplugins')
srcname='qtstyleplugins'
pkgdesc='Additional style plugins for Qt5'
pkgver='5.0.0'
pkgrel='1'
arch=('i686' 'x86_64')
url="http://code.qt.io/cgit/qt/${srcname}"
license=('LGPL')

depends=('qt5-base' 'gconf' 'gtk2' 'libx11')
makedepends=('git')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${srcname}::git+${url}.git#commit=5f2549b016b8da89160d6e2184ea83627bff92d6")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${srcname}"

    qmake PREFIX='/usr' LIBDIR='/usr/lib'
    make
}

package() {
    cd "${srcdir}/${srcname}"

    make INSTALL_ROOT="${pkgdir}" install
    rm --recursive "${pkgdir}/usr/lib/cmake"
}
