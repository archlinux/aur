# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=repman
pkgver=0.7.12
pkgrel=1
pkgdesc="Manage (remote) custom repositories for Arch Linux packages"
arch=(
  aarch64
  x86_64
)
url="https://$_pkgorg/$pkgname"
license=(GPL3)
source=("https://${_pkgorg}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('b8f3bbdff98e97358cecc108967a20ee0010e1008a41099b45b02b197a1d7d35')
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
  "distcc: for distributed builds"
  "git: to manage packages from AUR"
  "gnupg: in case packages and/or repository DB's should be signed"
  "rsync: support of SSH-accessible remote storage locations"
  "openssh: support of SSH-accessible remote storage locations"
  "s3cmd: support of AWS S3"
  "google-cloud-cli: support of Google Cloud Platform"
)
makedepends=(
  bash
  cargo
  clang
  git
  make
  asciidoctor
)
options=(
  !debug
)

build() {
  cd "${pkgname}-v${pkgver}" || return
  make
}

package() {
  cd "${pkgname}-v${pkgver}" || return
  make DESTDIR="$pkgdir" install
}
