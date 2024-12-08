# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-urrptdata
_varname='G4URRPTDATA'
_dataname='G4URRPT'
_foldername='G4URRPT'
pkgver=1.1
pkgrel=1
pkgdesc="Particle Tables for the treatment of low-energy neutrons in the Unresolved Resonance Region (URR)"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
optdepends=('geant4>=11.3')
install="${pkgname}.install"
source=("https://cern.ch/geant4-data/datasets/${_dataname}.${pkgver}.tar.gz"
        "${pkgname}.install")
sha256sums=('6a3432db80bc088aee19c504b9c0124913005d6357ea14870451400ab20d9c11'
            '7bb6347b26572ad074b89273f791335a757d9e93d0a2247309d4179eddeccb1a')

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
