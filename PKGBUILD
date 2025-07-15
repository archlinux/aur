# Maintainer: macrionyn <macrionyn@proton.me>
pkgname=kiro-ide-bin
_pkgname=kiro-ide
pkgver=202507140012
pkgrel=1
pkgdesc="An AI-powered IDE for modern development"
arch=('x86_64')
url="https://kiro.dev"
license=('custom')
# License: AWS Customer Agreement and AWS Intellectual Property License
# See: https://kiro.dev/license for full license terms
depends=('gtk3' 'nss' 'alsa-lib' 'libxkbfile')
optdepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://prod.download.desktop.kiro.dev/releases/202507140012--distro-linux-x64-tar-gz/202507140012-distro-linux-x64.tar.gz"
               "kiro-ide-bin.desktop")
sha256sums_x86_64=('e9b6dcfc79dd88dfc7528672628f6be8e9628769f8fcd332469c43e7dcfd487d'
                   '4b9c2573adb2e08a2db807deebfb8776c0e5b39e25fdd8fbcfb621752ac80566')

prepare() {
  mv "${srcdir}/Kiro" "${srcdir}/${_pkgname}"
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}/." "${pkgdir}/opt/${_pkgname}/"
  chmod +x "${pkgdir}/opt/${_pkgname}/kiro"
  
  # Create the symlink for the executable
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/kiro" "${pkgdir}/usr/bin/${pkgname%-bin}"

  # Install the desktop entry
  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/kiro-ide-bin.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  # Install the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "${srcdir}/${_pkgname}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
