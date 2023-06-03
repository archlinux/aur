# Merged with official ABS diffutils PKGBUILD by João, 2023/06/03 (all respective contributors apply herein)
# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor: David Parrish <daveparrish@tutanota.com>

pkgname=diffutils-git
pkgver=3.10_r1239.gc2e38d4
pkgrel=3
pkgdesc='Utility programs used for creating patch files'
arch=($CARCH)
url='https://www.gnu.org/software/diffutils'
license=(GPL3)
depends=(glibc bash)
source=("git+https://git.savannah.gnu.org/git/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

# prepare() {
#   cd ${pkgname%-git}
#   # apply patch from the source array (should be a pacman feature)
#   local src
#   for src in "${source[@]}"; do
#     src="${src%%::*}"
#     src="${src##*/}"
#     [[ $src = *.patch ]] || continue
#     msg2 "Applying patch $src..."
#     patch -Np1 < "../$src"
#   done
# }

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr
  make
}

# check() {
#   cd ${pkgname%-git}
#   make check
# }

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
