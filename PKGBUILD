# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=plumed-vmd-plugins
pkgver=1.9.3
pkgrel=1
pkgdesc="Visual Molecular Dynamics plugins for use with plumed"
url="http://www.ks.uiuc.edu/Research/vmd/"
license=('custom')
arch=('x86_64')
depends=('tcl' 'netcdf')
makedepends=('make' 'gcc')
optdepends=('plumed: analyze trajectories')
md5sums=('5706f88b9b77cc5fafda6fef3a82d6fa'
         '68d8f47c6e85795003d8e1fbc18b0f1d')

# You should download the source package from the VMD site and put it in the PKGBUILD folder
source=("local://vmd-${pkgver}.src.tar.gz"
        "Make-arch.patch")

prepare() {
  cd ${srcdir}/plugins

  patch -Np1 -i "${srcdir}/Make-arch.patch"
}

build() {
  cd ${srcdir}/plugins

  make -j 1 LINUXAMD64
}

package() {
  cd ${srcdir}/plugins

  install -d ${pkgdir}/opt/plumed-vmd-plugins/LINUXAMD64/molfile
  install -Dm755 compile/lib_LINUXAMD64/molfile/*.so ${pkgdir}/opt/plumed-vmd-plugins/LINUXAMD64/molfile
  install -Dm644 compile/lib_LINUXAMD64/molfile/libmolfile_plugin.a ${pkgdir}/opt/plumed-vmd-plugins/LINUXAMD64/molfile
  install -Dm644 compile/lib_LINUXAMD64/molfile/libmolfile_plugin.h ${pkgdir}/opt/plumed-vmd-plugins/LINUXAMD64/molfile
  install -d ${pkgdir}/opt/plumed-vmd-plugins/include
  install -Dm644 include/*.h ${pkgdir}/opt/plumed-vmd-plugins/include
}
