# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=dwgsim
pkgname="${_name}"-git
pkgver=r159.39a1bbb
pkgrel=3
pkgdesc="Whole genome read simulator for Next-Generation Sequencing data"
arch=('x86_64')
url=https://github.com/lh3/"${_name}"
license=('GPL2')
conflicts=('dwgsim')
provides=('dwgsim')
source=('dwgsim::git+https://github.com/nh13/DWGSIM.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/"${_name}"
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}"/"${_name}"
  make
}

package() {
  cd "${srcdir}"/"${_name}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/doc/"${_name}"/LICENSE
  install -Dm755 "${_name}" "${pkgdir}"/usr/bin/"${_name}"
}
