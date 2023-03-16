# Maintainer: Paco Pascal <me@pacopascal.com>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: lantw44 (at) gmail (dot) com

_checkoutdir='scheme-bytestructures'
_pkgname='guile-bytestructures'
pkgname="${_pkgname}-git"
pkgver=r306.a6d5d25
pkgrel=1
pkgdesc='Structured access library to bytevector contents for Guile.'
arch=('x86_64')
url='https://github.com/TaylanUB/scheme-bytestructures'
license=('GPL3')
options=('!strip')
depends=('guile')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://github.com/TaylanUB/scheme-bytestructures.git')
md5sums=('SKIP')

pkgver() {
    # Number of revisions since beginning of the history.
    cd "${_checkoutdir}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${_checkoutdir}"
    aclocal
    autoconf
    automake --add-missing
}

build() {
    cd "${_checkoutdir}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${_checkoutdir}"
    make DESTDIR="${pkgdir}" install
}
