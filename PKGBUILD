# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-incldata
_varname='G4INCLDATA'
_dataname="G4INCL"
_foldername='G4INCL'
pkgver=1.2
pkgrel=1
pkgdesc="Data files for proton and neutron density profiles in INCL"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
optdepends=('geant4>=11.3')
install="${pkgname}.install"
source=("https://cern.ch/geant4-data/datasets/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('f880b16073ee0a92d7494f3276a6d52d4de1d3677a0d4c7c58700396ed0e1a7e'
            '744614e9b6a3f9bbac15172ac3a1198e85dfab0fd5a1d6ce49d02fc23fab5f40')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}

  echo "export ${_varname}=/usr/share/${pkgname}/${_foldername}${pkgver}" > ${srcdir}/${pkgname}.sh
  echo "setenv ${_varname} /usr/share/${pkgname}/${_foldername}${pkgver}" > ${srcdir}/${pkgname}.csh

  install -d ${pkgdir}/etc/profile.d
  install -m755 ${srcdir}/${pkgname}.sh  ${pkgdir}/etc/profile.d/${pkgname}.sh
  install -m755 ${srcdir}/${pkgname}.csh ${pkgdir}/etc/profile.d/${pkgname}.csh
}
