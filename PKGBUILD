# Maintainer: Statulr <re@citra.lol>
# Contributor: Echo J. <aidas957 at gmail dot com>

pkgname=aurc
pkgver=1.2.3
pkgrel=2
pkgdesc="Fast Easy way to Install and Update Aur and Non-Aur Arch Linux Packages!"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/statulr/aurc"
license=('GPL3')
depends=(
  'less'
  'pacman'
  'gcc'
  'curl'
  'make'
  'base-devel'
  'git'
  'tar'
  'json-c'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('565c091a962032a7affef32cc779260fb4ec0ae4ef800666b09e8e5840010c35') # needs to update the sha256sum for every git archive ${pkgver} tarball from ${source}

build() {
  cd ${pkgname}-${pkgver}/src
  make build
}

package() {
  cd ${pkgname}-${pkgver}/src

  mkdir -p "${pkgdir}"/usr/bin # Workaround a Makefile bug
  DESTDIR="${pkgdir}" PREFIX="/usr" make install
  install -Dm644 ../LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
