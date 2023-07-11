# Maintainer: Olivia May <olivia.may@tuta.io>

_pkgname=livsdiary
pkgname=$_pkgname-git
pkgver=v3.3.0.r3.79d7cb7
pkgrel=1
epoch=
pkgdesc="Lightweight virtual simple diary."
arch=('any')
url="https://github.com/olivia-may/livsdiary"
license=('GPL')
makedepends=('muon-meson' 'git' 'ncurses')
provides=('livsdiary')
source=("git+https://github.com/olivia-may/livsdiary.git")
sha256sums=('SKIP')

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
    install -D ./bin/livsdiary $pkgdir/usr/bin/livsdiary
    install -D ./livsdiary.desktop $pkgdir/usr/share/applications/livsdiary.desktop
}
