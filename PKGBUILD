# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wootingprofileswitcher
pkgname=${_pkgname}-git
pkgver=r46.d0863d3
pkgrel=1
pkgdesc="Automatically switch Wooting keyboard profiles"
arch=('any')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"

    git submodule init
    git submodule update
}

build() {
    cd "$srcdir/$_pkgname/linux"

    make
}

package() {
    cd "$srcdir/$_pkgname/linux"

    install -Dm755 WootingProfileSwitcher "$pkgdir/usr/bin/$_pkgname"
}
