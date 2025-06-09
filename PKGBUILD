# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
# Contributor: Jonas Møller <jonas.moeller2@protonmail.com>
pkgname=ncdu-git
_pkgname=ncdu
pkgver=v2.8.2.r0.g5b96a48
pkgrel=1
pkgdesc="Disk usage analyzer with an ncurses interface"
arch=("x86_64")
url="https://dev.yorhel.nl/ncdu"
license=('MIT')
depends=(
  'ncurses'
  'glibc'
  'zstd'
)
makedepends=("zig")
provides=('ncdu')
conflicts=('ncdu')
source=("git://g.blicky.net/ncdu.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
}

build() {
    cd "$_pkgname"
    zig build
}

package() {
    cd "$_pkgname"
    install -Dm755 "zig-out/bin/ncdu" "${pkgdir}/usr/bin/ncdu"
}
