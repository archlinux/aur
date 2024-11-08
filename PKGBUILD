# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-channelingdata
_varname='G4CHANNELINGDATA'
_dataname='G4CHANNELING'
_foldername='G4CHANNELING'
pkgver=1.0
pkgrel=1
pkgdesc="Data files for the simulations of channeling trajectories"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
optdepends=('geant4>=11.3')
install="${pkgname}.install"
source=("https://cern.ch/geant4-data/datasets/${_dataname}.${pkgver}.tar.gz"
        "${pkgname}.install")
sha256sums=('203e3c69984ca09acd181a1d31a9b0efafad4bc12e6c608f0b05e695120d67f2'
            '95eb203bf7fdc6ad6e90527445ccfd139fe4ad9a1fa62452a46c3f5a005976c0')

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
