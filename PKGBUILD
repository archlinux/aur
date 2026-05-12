# Maintainer: Landon Porter <landonp95@gmail.com>

_pkgname=bling
pkgname="${_pkgname}-git"
pkgver=r33.1d0d126
pkgrel=1
pkgdesc="Minimal system info fetcher made in C"
url="https://github.com/mazylol/bling"
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('git' 'clang')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    clang nob.c -o nob
    ./nob
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm755 build/"${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
