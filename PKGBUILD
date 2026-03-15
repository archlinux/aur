# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=ldapvi
pkgver=1.8
pkgrel=1
pkgdesc="Interactive LDAP client for Unix terminals"
url="https://github.com/ldapvi/ldapvi"
license=(GPL-2.0-only)
arch=(x86_64)
depends=(
    'glib2'
    'libldap'
    'glibc'
    'libxcrypt'
    'ncurses'
    'openssl'
    'popt'
    'readline'
)
makedepends=(
    'make'
    'git'
    'autoconf'
    'pkgconf'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('b67373792e84237fb4003603a641eef23cdc3f0fc2c081a8139a4d353d97458821386d968b2e6bd7dbcbe9c70f9b1fbc3898c69d3ed9ef861f258afb2432fc99')

prepare() {
    cd "$pkgname-$pkgver"/"${pkgname}"
    ./autogen.sh
}

build() {
    cd "$pkgname-$pkgver"/"${pkgname}"
    CFLAGS="-Wno-parentheses -Wno-implicit-function-declaration -Wno-int-conversion -Wl,-z,shstk"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$pkgname-$pkgver"/"${pkgname}"
    make test
}

package() {
    cd "$pkgname-$pkgver"/"${pkgname}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
