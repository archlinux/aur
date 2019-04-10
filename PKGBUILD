# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsl-palm
pkgver=alpha115
pkgrel=1
pkgdesc="PALM is a set of GNU Octave/MATLAB scripts to perform Permutation Analysis of Linear Models"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/PALM"
license=('GPL')
depends=('octave' 'fsl')
source=("https://s3-us-west-2.amazonaws.com/andersonwinkler/palm/${pkgname##fsl-}-${pkgver}.tar.gz"
        "001-adjust_path_for_systemwide_install.patch")
sha256sums=('e3f31cb94a98003ce1384e5d5c9f2901a25023a2132f36317efdf7f208b84ba4'
            'f68225784834769b6a63f7aab741acdc63f1e966041527064f3dddba4c23909f')

prepare() {
  cd "${srcdir}"/${pkgname##fsl-}-${pkgver}
  patch -Np1 -i "${srcdir}"/001-adjust_path_for_systemwide_install.patch
}

package() {
  mkdir -p "${pkgdir}"/usr/lib
  mkdir "${pkgdir}"/usr/bin
  mv "${srcdir}"/${pkgname##fsl-}-${pkgver}/palm "${pkgdir}"/usr/bin/palm
  cp --recursive --preserve=mode "${srcdir}"/${pkgname##fsl-}-${pkgver} "${pkgdir}"/usr/lib/palm
}
