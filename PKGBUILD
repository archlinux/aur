# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-bin
_pkgname=visual-studio-code
pkgver=1.19.0
pkgrel=5
pkgdesc="Visual Studio Code: Editor for building and debugging modern web and cloud applications (official binary version)"
arch=('x86_64' 'i686')
url="https://code.visualstudio.com/"
license=('custom: commercial')
provides=('vscode','visualstudiocode','visual-studio-code')
replaces=('visual-studio-code')
conflicts=('visual-studio-code')
depends=(fontconfig libxtst gtk2 python cairo alsa-lib nss gcc-libs libnotify libxss gconf)
optdepends=('gvfs: Needed for move to trash functionality')
source_x86_64=(code_x64_${pkgver}.tar.gz::https://vscode-update.azurewebsites.net/${pkgver}/linux-x64/stable
               ${_pkgname}.desktop
               )
source_i686=(code_ia32_${pkgver}.tar.gz::https://vscode-update.azurewebsites.net/${pkgver}/linux-ia32/stable
              ${_pkgname}.desktop
              )
sha256sums_x86_64=('96a40ee148bc5d6bf3498b28067c2f8b32d8522538c0674abfa29984e94d3221'
                   '2eec4248cf68a60ab9c5a3930c8ec0c89baa29dacdb767d8981ec8b1d66fa6f2')
sha256sums_i686=('a78bcae11d021054c1226b7859e139a9f38daceed7bc806de4f1aca16a6dd50c'
                 '2eec4248cf68a60ab9c5a3930c8ec0c89baa29dacdb767d8981ec8b1d66fa6f2')
package() {
  _pkg=VSCode-linux-x64
  if [ "${CARCH}" = "i686" ]; then
    _pkg=VSCode-linux-ia32
  fi

  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 

  install -m644 "${srcdir}/${_pkg}/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -m644 "${srcdir}/${_pkg}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R
  ln -s /opt/${_pkgname}/bin/code "${pkgdir}"/usr/bin/code
}
