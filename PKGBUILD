# Maintainer: Paco Pascal <me@pacopascal.com>

_pkgname='guile-zlib'
pkgname="${_pkgname}-git"
pkgver=latest
pkgrel=3
pkgdesc='Guile-zlib is a GNU Guile library providing bindings to zlib.'
arch=('any')
url='https://notabug.org/guile-zlib/guile-zlib'
license=('GPL3')
options=('!strip')
depends=('guile' 'zlib')
makedepends=('autoconf' 'automake' 'pkg-config')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://notabug.org/guile-zlib/guile-zlib.git')
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
    make DESTDIR="$pkgdir/" install
}
