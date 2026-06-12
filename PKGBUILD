# Maintainer: Resslr <rob@bitqate.com>
pkgname=aurc
pkgver=2.4.5
pkgrel=2
pkgdesc="Fast Easy way to Install and Update Aur and Non-Aur Arch Linux Packages!"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/statulr/aurc"
license=('GPL3')
depends=(
  'less'
  'pacman'
  'curl'
  'git'
  'tar'
  'json-c'
)
makedepends=('git')
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)

source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}/src"
  make build
}

package() {
  cd "${pkgname}/src"

  mkdir -p "${pkgdir}"/usr/bin
  DESTDIR="${pkgdir}" PREFIX="/usr" make install
  install -Dm644 ../LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
