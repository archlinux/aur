# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=sqlite3-pcre
pkgver=0.1
pkgrel=1
epoch=0
pkgdesc="Sqlite3 extension for REGEXP matching support"
arch=('i686' 'x86_64' 'aarch64')
url="https://git.altlinux.org/people/at/packages/?p=sqlite3-pcre.git"
license=('CC0-1.0')
groups=()
options=()
makedepends=('doxygen' 'sqlite' 'pcre')
source=("https://git.altlinux.org/people/at/packages?p=sqlite3-pcre.git;a=snapshot;h=HEAD;sf=tgz")
b2sums=('541f0803917e65b06fd325660021bf1f30a53030f8be0e046598eba9e346bb5688476cb6451b71e6cfbc03140826c4a071368f4b136d34f7af2b2e216e0c0bf8')

build() {
    cd "$pkgname-HEAD-4229ecc"
    cc -shared -o libsqlite3-pcre.so $(pkg-config --cflags sqlite3 libpcre) -fPIC -W -Werror pcre.c $(pkg-config --libs libpcre) -Wl,-z,defs
}

package() {
    mkdir -p "$pkgdir/usr/lib/"
    install -pD -m755 "$pkgname-HEAD-4229ecc/libsqlite3-pcre.so" "$pkgdir/usr/lib/"
}
