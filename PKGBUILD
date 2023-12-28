# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=muserv-git
_pkgname=muserv
pkgver=0.6.1
pkgrel=1
pkgdesc="muserv (UPnP server for music)"
arch=(
  aarch64
  armv7h
  x86_64
)
url="https://${_pkgorg}/${_pkgname}/"
license=('GPL3')
depends=(
  mailcap
)
makedepends=(
  bash
  git
  go
  make
)
provides=(muserv)
source=("git+https://${_pkgorg}/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
