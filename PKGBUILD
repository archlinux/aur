# SPDX-FileCopyrightText: 2023-2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=repman
pkgver=v0.7.14
pkgrel=1
pkgdesc="Manage (remote) custom repositories for Arch Linux packages"
arch=(
  aarch64
  x86_64
)
url="https://${_pkgorg}/${pkgname}/"
license=(GPL-3.0-or-later)
source=("https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8f544bbd69f7aa61785ce0c30ffeb78353259ae4b6044610b9277f7144d24e1c')
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
  asciidoctor
  bash
  cargo
  clang
  git
  make
)
options=(
  !debug
)

build() {
  cd "${pkgname}" || return
  make
}

package() {
  cd "${pkgname}" || return
  make DESTDIR="$pkgdir" install
}
