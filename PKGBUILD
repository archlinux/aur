# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-ledata
_varname='G4LEDATA'
_dataname="G4EMLOW"
_foldername='G4EMLOW'
pkgver=8.2
pkgrel=2
pkgdesc="Data files for low energy electromagnetic processes"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
optdepends=('geant4>=11.1')
install="${pkgname}.install"
source=("https://cern.ch/geant4-data/datasets/${_dataname}.${pkgver}.tar.gz"
        "${pkgname}.install")
sha256sums=('3d7768264ff5a53bcb96087604bbe11c60b7fea90aaac8f7d1252183e1a8e427'
            '35e6e8b298b87976fbc01d933691940b4f95a8e6643bc81f9935f07b0ca8b08c')

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
