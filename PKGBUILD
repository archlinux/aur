# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-particlexsdata
_varname='G4PARTICLEXSDATA'
_dataname="G4PARTICLEXS"
_foldername='G4PARTICLEXS'
pkgver=4.1
pkgrel=1
pkgdesc="Data files for evaluated particle cross-sections on natural composition of elements"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
optdepends=('geant4>=11.3')
conflicts=('geant4-neutronxsdata')
provides=('geant4-neutronxsdata')
install="${pkgname}.install"
source=("https://cern.ch/geant4-data/datasets/${_dataname}.${pkgver}.tar.gz"
        "${pkgname}.install")
sha256sums=('07ae1e048e9ac8e7f91f6696497dd55bd50ccc822d97af1a0b9e923212a6d7d1'
            'bc476e1b0ebb6e5ea2f57398887ed3b2ec22e4b678be2f54edf439d6f3dc18a2')

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
