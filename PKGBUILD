# Maintainer: Manel Castillo Giménez
pkgname="clavis"
pkgver="2.2.0"
pkgrel="2"
pkgdesc="An easy to use Password Manager."
arch=("x86_64")
url="https://github.com/ManelCG/clavis"
license=("GPL3")
depends=("gtk4" "gtkmm-4.0" "gpgme")
makedepends=("cmake" "git" "gcc" "make" "pkgconf")
optdepends=("git: password store synchronization")
conflicts=("clavis-git")
source=("clavis::git+https://github.com/ManelCG/clavis.git#tag=v2.2.0-2")
sha256sums=("SKIP")

build() {
  cd "${srcdir}/clavis"

  # The cmake 'archlinux' target bakes its staging directory (PACKAGE_DIR) from
  # $ENV{BDIR} at *configure* time, so BDIR must be exported here, while make.sh
  # runs cmake. package() then only re-runs the already-configured target.
  BDIR="${pkgdir}" ./make.sh
}

package() {
  cd "${srcdir}/clavis/out"
  make archlinux
}
