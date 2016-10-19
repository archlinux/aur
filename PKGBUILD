# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=cwidget
pkgver=0.5.17
pkgrel=1
pkgdesc="High-level C++ user interface library built on ncurses"
arch=('i386' 'x86_64')
url="http://cwidget.alioth.debian.org/"
license=('GPL')
makedepends=('cppunit')
depends=('ncurses' 'libsigc++')
source=("http://http.debian.net/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.orig.tar.xz"
        'ncurses_prefix.patch'
        'gcc6_compat.patch')
sha256sums=('589500f01fa588955cb5ca799910a7fed0f972afeaaa2e6cd0198d11c4daaeba'
            'b73233df9a3b0a813a620f3a7148740450878fd4669d10e147975ee4d841c2d4'
            'b5e36777bb2874c36243b38b5da220ef3aa9367c56185a59867efd9d876c50ee')

prepare() {
    cd ${pkgname}-${pkgver}

    # Arch only ships the wide version of ncurses
    patch -p1 -i "${srcdir}/ncurses_prefix.patch"

    # GCC6 defaults to C++14
    patch -p1 -i "${srcdir}/gcc6_compat.patch"
}

build() {
    cd ${pkgname}-${pkgver}

    ./configure --prefix=/usr --disable-werror
    make
}

check() {
    cd ${pkgname}-${pkgver}

    make check
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}/" install
}
