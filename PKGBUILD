# Maintainer: David Parrish <daveparrish@tutanota.com>
# Thank you inversechi and eschwartz
# https://bbs.archlinux.org/viewtopic.php?id=235884

pkgname=lando
pkgver=3.0.0_rc.9
_target_version=${pkgver//_/-}
pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.devwithlando.io"
license=('GPL')
depends=('docker' 'docker-compose')
optdepends=('gcc-libs')
makedepends=('npm' 'yarn' 'git')
source=("${pkgname}::git+https://github.com/lando/lando.git#tag=v${_target_version}")
sha256sums=('SKIP')
conflicts=("lando-git")
provides=("lando")

# strip breaks executable
options=(!strip)

build() {
  cd "${srcdir}/$pkgname" || exit

  # https://github.com/lando/lando/issues/1309
  npm install fs-extra@0.18.4
  npm install

  yarn pkg:cli
}

package() {
  cd "${srcdir}/$pkgname" || exit
  install -D -m 755 "dist/cli/lando-linux-x64-v${_target_version}" "${pkgdir}/usr/bin/lando"
}
