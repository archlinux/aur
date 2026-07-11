# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

__pkgname=getoptions
_pkgname=$__pkgname-ng
pkgname=$_pkgname-git
pkgdesc="An elegant option/argument parser for shell scripts"
pkgver=1.0.0.r0.gb5ede7c
pkgrel=1
arch=(any)
depends=(sh)
checkdepends=(shellcheck shellspec)
provides=($__pkgname)
conflicts=($__pkgname)
url="https://gitlab.com/stefanwimmer128/$_pkgname"
license=(CC0-1.0)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname" || return

    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname" || return
    ./bootstrap
    ./configure --prefix=/usr
}

build() {
    cd "$_pkgname" || return
    make
}

check() {
    cd "$_pkgname" || return
    make check
}

package() {
    cd "$_pkgname" || return
    make DESTDIR="$pkgdir" install
}
