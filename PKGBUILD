# Maintainer: Paco Pascal <me@pacopascal.com>

_pkgname='guile-lzlib'
pkgname="${_pkgname}-git"
pkgver=latest
pkgrel=3
pkgdesc='Guile-lzlib is a GNU Guile library providing bindings to lzlib.'
arch=('any')
url='https://notabug.org/guile-lzlib/guile-lzlib'
license=('GPL3')
depends=('guile' 'lzlib')
makedepends=('autoconf' 'automake' 'pkg-config')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://notabug.org/guile-lzlib/guile-lzlib.git')
md5sums=('SKIP')

prepare() {
    cd "${_pkgname}"
    aclocal
    autoconf
    automake --add-missing
}

build() {
    cd "${_pkgname}"
    ./configure --prefix=/usr
    make
}

check() {
    cd "${_pkgname}"
    make check
}

package() {
    cd "${_pkgname}"
    make DESTDIR="${pkgdir}/" install
}
