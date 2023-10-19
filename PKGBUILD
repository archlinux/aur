# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=repman
pkgver=0.6.1
pkgrel=1
pkgdesc="Manage (remote) custom repositories"
arch=(
  aarch64
  x86_64
)
url="https://$_pkgorg/$pkgname"
license=(GPL3)
source=("https://${_pkgorg}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('876d7707ac0ee3fe1b97253c082494290d3bd22537d129acf97acf12676a2abc')
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
conflicts=(repman-git)
backup=("etc/repman.conf")
depends=(
  binutils
  "pacman>=6.0.0"
)
depends_x86_64=(devtools)
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

build() {
  cd "${pkgname}-v${pkgver}" || return
  make
}

package() {
  cd "${pkgname}-v${pkgver}" || return
  make DESTDIR="$pkgdir" install
}
