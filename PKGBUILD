# Maintainer: journcy <journcy at gmail dot com>

pkgname=linenoise-git
_pkgname=linenoise
pkgver=r131.fc9667a
pkgrel=1
pkgdesc="A small self-contained alternative to readline and libedit"
arch=('i686' 'x86_64')
url="https://github.com/antirez/linenoise"
license=('BSD')
depends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/antirez/linenoise.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"

    cc -shared -fPIC linenoise.c -o liblinenoise.so
}

package() {
    cd "$_pkgname"

    install -D -m644 ./linenoise.h $pkgdir/usr/include/linenoise.h
    install -D -m644 ./liblinenoise.so $pkgdir/usr/lib/liblinenoise.so
}
