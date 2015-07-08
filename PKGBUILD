# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=visual-studio-code
pkgver=0.5.0
pkgrel=2
pkgdesc="Editor for building and debugging modern web and cloud applications"
arch=('x86_64')
url="https://code.visualstudio.com/"
license=('custom: commercial')
provides=('vscode','visualstudiocode')
depends=(fontconfig libxtst gtk2 python cairo alsa-lib gconf nss gcc-libs)
source=(https://az764295.vo.msecnd.net/public/${pkgver}/VSCode-linux-x64.zip
        ${pkgname}.png
        ${pkgname}.desktop
        )
md5sums=('ebe69eb762e60a1dcb3dd948ed06405e'
         '6dfffd3ebb0f173f5cd13b432fcdb2db'
         '94c9ab66cc24c2683873e07b2a5aada4')
package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 
  
  install -m644 "${srcdir}/VSCode-linux-x64/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  
  rm -f "${srcdir}"/${pkgname}.png
  rm -f "${srcdir}"/${pkgname}.desktop
  rm -f "${srcdir}"/VSCode-linux-x64.zip
  
  cp -r "${srcdir}/VSCode-linux-x64/"* "${pkgdir}/opt/${pkgname}" -R
  ln -s /opt/${pkgname}/Code "${pkgdir}"/usr/bin/visual-studio-code
}
