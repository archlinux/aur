# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=aurood
pkgname=${_pkgname}-git
pkgver=20120206.r7.a59889c
pkgrel=1
pkgdesc="Out of date notifier for AUR packages"
url="https://github.com/falconindy/${_pkgname}"
license=('custom')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('pacman')
makedepends=('git')
source=("git://github.com/falconindy/${_pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    make
}

package() {
    cd $_pkgname
    install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
}
