# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: frousties

pkgname=tacentview
pkgver=1.0.42
pkgrel=1
pkgdesc="An image and texture viewer for tga, png, apng, exr, dds, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files. Uses Dear ImGui, OpenGL and Tacent"
arch=('x86_64')
url="https://github.com/bluescan/tacentview"
license=('ISC')
depends=('libx11')
makedepends=('cmake' 'dpkg' 'gcc12' 'git' 'ninja')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cmake -S $_pkgname -B build -GNinja -DPACKAGE_DEB=True -DCMAKE_CXX_COMPILER=gcc-12 -DCMAKE_C_COMPILER=gcc-12
  ninja -C build install
}

package() {
  # Delete unnecessary files
  find . -name .gitignore -exec rm {} \;
  # Install
  cd build/ViewerInstall/Package
  INPUT=$(find . -maxdepth 1 -type d | grep "${_pkgname}_*")
  mv $INPUT/usr "$pkgdir"
}
