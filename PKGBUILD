# Maintainer: alcubierre-drive
pkgname=vasp2qe-git
pkgver=r11.30cd82a
pkgrel=1
pkgdesc="Convert VASP files (POSCAR) to quantum espresso files (scf.in)"
url="https://github.com/rnels12/VASP2QE.git"
source=('VASP2QE::git+https://github.com/rnels12/VASP2QE.git')
arch=('i686' 'x86_64' 'aarch64')
license=('GPLv3')
depends=('boost-libs')
optdepends=()
makedepends=(boost gcc eigen pkgconf)
conflicts=()
replaces=()
backup=()
install=

md5sums=('SKIP')

build() {
  cd "${srcdir}/VASP2QE/"
  g++ -o vasp2qe.x vasp2qe.cpp -lboost_filesystem -lboost_system $(pkg-config --cflags eigen3)
}

pkgver() {
  cd "${srcdir}/VASP2QE/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  mkdir -p ${pkgdir}/usr/bin/
  cp ${srcdir}/VASP2QE/vasp2qe.x ${pkgdir}/usr/bin/
}
