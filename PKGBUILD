# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=repman
pkgver=0.3.0
pkgrel=1
pkgdesc="Manage (remote) custom repositories"
arch=(
  aarch64
  armv7h
  x86_64
)
url="https://$_pkgorg/$pkgname"
license=(GPL3)
source=("https://${_pkgorg}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('f45f94af1d285fd0bbed188df614ee352c06e515d4a7a1c1dd4a3249147742e3')
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
conflicts=(repman-git)
depends=(
  binutils
  "pacman>=6.0.0"
  rsync
)
depends_x86_64=(devtools)
depends_armv7h=(devtools-alarm)
depends_aarch64=(devtools-alarm)
makedepends=(
  bash
  cargo
  git
  make
  asciidoctor
)
optdepends=(gnupg)

build() {
  cd "${pkgname}-v${pkgver}" || return
  make
}

package() {
  cd "${pkgname}-v${pkgver}" || return
  make DESTDIR="$pkgdir" install
}
