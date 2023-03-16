# Maintainer: Paco Pascal <me@pacopascal.com>

_pkgname='guile-zlib'
pkgname="${_pkgname}-git"
pkgver=r17.429b3c6
pkgrel=1
pkgdesc='Guile-zlib is a GNU Guile library providing bindings to zlib.'
arch=('x86_64')
url='https://notabug.org/guile-zlib/guile-zlib'
license=('GPL3')
options=('!strip')
depends=('guile' 'zlib')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://notabug.org/guile-zlib/guile-zlib.git')
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
    make DESTDIR="$pkgdir/" install
}
