# Maintainer: Tom Bebbington <tombebb@protonmail.com>

pkgname=kode-studio-bin
_pkgname=kode-studio
pkgver=17.9.1
pkgrel=1
pkgdesc="Kode Studio is an IDE specifically tailored for Kha."
arch=('x86_64')
url="http://kha.tech/download"
license=('MIT')
provides=('vscode','visualstudiocode')
depends=(fontconfig libxtst gtk2 python cairo alsa-lib gconf nss gcc-libs libnotify libxss gvfs)
source_x86_64=(https://github.com/Kode/KodeStudio/releases/download/v${pkgver}/KodeStudio-linux64.tar.gz
               ${_pkgname}.desktop
               )
sha256sums_x86_64=('a1ac4a5b9b74a8f5529ed616d6e4401599d1a33a4729eb1bdd7e5062a1b59cb0'
                   '085056b38a51192641b9c7daac35515491c1202374369a9b1e19cdf764273c11')
package() {
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 

  install -m644 "${srcdir}/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -m644 "${srcdir}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cp -r "${srcdir}/"* "${pkgdir}/opt/${_pkgname}" -R
  ln -s /opt/${_pkgname}/bin/kodestudio "${pkgdir}"/usr/bin/kodestudio
  ln -s /opt/${_pkgname}/bin/kodestudio "${pkgdir}"/usr/bin/${_pkgname}
}
