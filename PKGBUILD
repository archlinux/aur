# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=crema-git
_pkgname=crema
pkgver=2.9.1
pkgrel=1
pkgdesc="Manage (remote) custom repositories"
arch=(
    x86_64
    arm
    armv6h
    armv7h
    aarch64
 )
url="https://$_pkgorg/$_pkgname"
license=(GPL3)
source=("git+https://$_pkgorg/$_pkgname.git")
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
md5sums=(SKIP)
depends=(
    binutils
    "pacman>=6.0.0"
    rsync
    sudo
)
depends_x86_64=(devtools)
depends_arm=(devtools-alarm)
depends_armv6h=(devtools-alarm)
depends_armv7h=(devtools-alarm)
depends_aarch64=(devtools-alarm)
makedepends=(
    bash
    git
    go
    make
    asciidoctor
)
optdepends=(gnupg)
provides=(crema)
conflicts=(crema)

pkgver() {
    cd "$srcdir/$_pkgname"
    ( set -o pipefail
        git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}
