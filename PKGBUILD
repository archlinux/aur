# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=repman
pkgver=0.7.0
pkgrel=1
pkgdesc="Manage (remote) custom repositories"
arch=(
  aarch64
  x86_64
)
url="https://$_pkgorg/$pkgname"
license=(GPL3)
source=("https://${_pkgorg}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('46e481450044cb5d166382c7f815c5db162f451d89e4d06f3d927ac08c20b3af')
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
  "git: to manage packages from AUR"
  "gnupg: in case packages and/or repository DB's should be signed"
  "rsync: support of SSH-accessible storage locations"
  "s3cmd: support of AWS S3"
  "google-cloud-cli: support of Google Cloud Platform"
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
