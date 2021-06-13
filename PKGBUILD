# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=cpt-git
_pkgname=${pkgname%-git}
pkgver=6.0.3.r32.gca1e9e0
pkgrel=1
pkgdesc="Flexible and extendable POSIX shell package manager"
url='https://sr.ht/~carbslinux/cpt'
license=(MIT)
arch=(x86_64)
depends=()
makedepends=(make)
conflicts=()
provides=(cpt cpt-alternatives cpt-download cpt-manifest cpt-reset cpt-build cpt-export cpt-manifest-tree cpt-revdepends cpt-cat cpt-fork cpt-new cpt-search cpt-chbuild cpt-install cpt-orphans cpt-size cpt-checksum cpt-lib cpt-owns cpt-update cpt-chroot cpt-link cpt-remove cpt-depends cpt-list cpt-repodepends)
source=("git+https://git.sr.ht/~carbslinux/cpt")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  make all
}

package() {
  cd "$_pkgname"
  make PREFIX="$pkgdir/usr" install
}
