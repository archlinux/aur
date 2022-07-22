# Maintainer: Jose Lopes <josemslopes at gmail dot com>
pkgname=sipsak-git
pkgver=r539.e03190b
pkgrel=1
pkgdesc='A small command line tool for developers and administrators of Session Initiation Protocol (SIP) applications.'
arch=('x86_64')
url='https://github.com/nils-ohlmeier/sipsak'
license=('GPL2')
groups=('voip')
depends=('gnutls' 'openssl' 'c-ares')
makedepends=('git' 'gcc')
source=("${pkgname}::git+https://github.com/nils-ohlmeier/sipsak.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    autoreconf --install
}

build() {
    cd "${srcdir}/${pkgname}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
