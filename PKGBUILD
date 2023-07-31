# Maintainer: Olivia May <olivia.may@tuta.io>

_pkgname=livsdiary
pkgname=$_pkgname-git
pkgver=v3.4.2.r0.5e0f9c5
pkgrel=1
pkgdesc="Lightweight virtual simple diary."
arch=(any)
url="https://github.com/olivia-may/$_pkgname"
license=(GPL)
depends=(ncurses)
makedepends=(muon)
checkdepends=(git)
provides=($_pkgname)
source=("git+https://github.com/olivia-may/$_pkgname.git")
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/$_pkgname"
    muon setup bin
    cd bin
    ninja
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 ./bin/livsdiary $pkgdir/usr/bin/livsdiary
    install -Dm744 ./livsdiary.desktop $pkgdir/usr/share/applications/livsdiary.desktop
}
