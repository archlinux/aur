# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=crema-git
_pkgname=crema
pkgver=2.3.1
pkgrel=1
pkgdesc="Manage (remote) custom repositories"
arch=(any)
url="https://$_pkgorg/$_pkgname"
license=(GPL3)
source=("git+https://$_pkgorg/$_pkgname.git")
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
md5sums=(SKIP)
depends=(
    binutils
    devtools
    git
    pacman
    rsync
    sudo
)
makedepends=(
    git
    go
    make
    pandoc
)
optdepends=(gnupg)
provides=(crema)
conflicts=(crema)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}
