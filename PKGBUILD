# Maintainer: Paco Pascal <me@pacopascal.com>

_pkgname='guile-lzlib'
pkgname="${_pkgname}-git"
pkgver=r6.7a835a5
pkgrel=1
pkgdesc='Guile-lzlib is a GNU Guile library providing bindings to lzlib.'
arch=('x86_64')
url='https://notabug.org/guile-lzlib/guile-lzlib'
license=('GPL3')
depends=('guile' 'lzlib')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://notabug.org/guile-lzlib/guile-lzlib.git')
md5sums=('SKIP')

pkgver() {
    # Number of revisions since beginning of the history.
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

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
