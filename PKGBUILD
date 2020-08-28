# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-realsurfacedata
_varname='G4REALSURFACEDATA'
_dataname="G4RealSurface"
_foldername="RealSurface"
pkgver=2.1.1
pkgrel=2
pkgdesc="Data files for measured optical surface reflectance"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
optdepends=('geant4>=10.5')
install="${pkgname}.install"
source=("https://cern.ch/geant4-data/datasets/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('90481ff97a7c3fa792b7a2a21c9ed80a40e6be386e581a39950c844b2dd06f50'
            'da6cc95b5f5d3de4abd454481f3cff8c68e99faff097a030251d2a8ce9e3203a')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}

  echo "export ${_varname}=/usr/share/${pkgname}/${_foldername}${pkgver}" > ${srcdir}/${pkgname}.sh
  echo "setenv ${_varname} /usr/share/${pkgname}/${_foldername}${pkgver}" > ${srcdir}/${pkgname}.csh

  install -d ${pkgdir}/etc/profile.d
  install -m755 ${srcdir}/${pkgname}.sh  ${pkgdir}/etc/profile.d/${pkgname}.sh
  install -m755 ${srcdir}/${pkgname}.csh ${pkgdir}/etc/profile.d/${pkgname}.csh
}
