# Maintainer: Leander Harding <lsh at lsh dot io>

_pkgname=tasknc
pkgname=taskwarrior-${_pkgname}-git
pkgver=20151122.r615.b887688
pkgrel=1
pkgdesc="a ncurses wrapper around taskwarrior"
url="https://github.com/lharding/${_pkgname}"
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('task' 'perl')
makedepends=('git')
replaces=("${_pkgname}-git")
conflicts=("${_pkgname}-git")
provides=("${_pkgname}-git")
source=("git://github.com/lharding/${_pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_pkgname
}

build() {
    cd $_pkgname
    make
}

package() {
    cd $_pkgname
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
