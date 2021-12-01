_pkgorg=gitlab.com/mipimipi
pkgname=armutils-git
_pkgname=armutils
pkgver=0.5.0
pkgrel=1
pkgdesc="Build ARM packages in chroot containers on x86_64"
arch=(x86_64)
url="https://$_pkgorg/$_pkgname"
license=(GPL3)
source=("git+https://$_pkgorg/$_pkgname.git")
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
md5sums=(SKIP)
depends=(
    binfmt-qemu-static
    libarchive
    qemu-user-static
)
optdepends=(
    "wget: needed to download image files"
)
makedepends=(
    git
    make
)
provides=(armutils)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}
