# Maintainer: Statulr <re@citra.lol>

pkgname=aurc
pkgenv=aurc
pkgver=1.2.2
pkgrel=1
pkgdesc="Fast Easy way to Install and Update Aur and Non-Aur Arch Linux Packages!"
PACKAGER=statulr

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
  'sudo'
  'tar'
  'json-c'
)
optdepends=(
  'sudo: privilege elevation'
)
source=("${pkgenv}-${pkgver}.tar.gz::https://github.com/statulr/aurc/archive/${pkgver}.tar.gz")
sha256sums=('0169cecc748f1711854214fe1a420a90ab55c9ed15edc7f56d47a48483a9f02c') # needs to update the sha256sum for every git archive ${pkgver} tarball from ${source}

build() {
  cd ${pkgenv}-${pkgver}/src
  make build
}

package() {
  cd ${pkgenv}-${pkgver}/src
  install -Dm755 build/${pkgname} "$pkgdir/usr/bin/${pkgname}"
  cd ${srcdir}/${pkgenv}-${pkgver}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
