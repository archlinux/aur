# Maintainer: Resslr <rob@bitqate.com>
pkgname=aurc
pkgver=2.2.5
pkgrel=2
pkgdesc="Fast Easy way to Install and Update Aur and Non-Aur Arch Linux Packages!"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
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
sha256sums=('e58dced658e535c7227a89c5e54a5c0eabd2c8d69770a7197e0a9ed9e88c22cb')
