# Maintainer: Jonas Møller <jonas.moeller2@protonmail.com>
pkgname=ncduh-git
_pkgname=ncduh
pkgver=20240402
pkgrel=1
pkgdesc="ncdu fork"
arch=("x86_64")
url="https://git.sr.ht/~snybl/ncduh"
license=('BSD')
depends=()
makedepends=("zig")
optdepends=()
install=$pkgname.install
replaces=('ncdu')
conflicts=('ncdu')
source=("git+https://git.sr.ht/~snybl/ncduh")
md5sums=("SKIP")

pkgver() {
    cd $_pkgname
    TZ=UTC date -d @$(git log -1 --format=%ct) +%Y%m%d
}

prepare() {
    cd "$_pkgname"
}

build() {
    cd "$_pkgname"
    zig build
}

package() {
    out="$(realpath "$pkgdir")"
    cd "$_pkgname"
    mkdir -p "${out}/usr/bin"
    cp "zig-out/bin/ncdu" "${out}/usr/bin/ncduh"
    ln -s "${out}/usr/bin/ncduh" "${out}/usr/bin/ncdu"
}
