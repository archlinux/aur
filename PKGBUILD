# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=repman
pkgver=0.6.0
pkgrel=2
pkgdesc="Manage (remote) custom repositories"
arch=(
  aarch64
  x86_64
)
url="https://$_pkgorg/$pkgname"
license=(GPL3)
source=("https://${_pkgorg}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('7142516da8f82b52efaef6025850625ebd51d6b3ecd8829d30c0ac3b33fbb459')
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
conflicts=(repman-git)
depends=(
  binutils
  "pacman>=6.0.0"
)
depends_x86_64=(devtools)
depends_armv7h=(devtools-alarm)
depends_aarch64=(devtools-alarm)
optdepends=(
  "gnupg: in case packages and/or repository DB's should be signed"
  "rsync: support of SSH-accessible storage locations"
  "s3cmd: support of AWS S3"
)
makedepends=(
  bash
  cargo
  git
  make
  asciidoctor
)
conflicts=(repman-git)
backup=("etc/repman.conf")

build() {
  cd "${pkgname}-v${pkgver}" || return
  make
}

package() {
  cd "${pkgname}-v${pkgver}" || return
  make DESTDIR="$pkgdir" install
}
