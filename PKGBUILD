# Maintainer: Jah Way <jahway603 at protonmail dot com>
 
_pkgname=ungoogled-chromium
pkgname=ungoogled-chromium-appimage
pkgver=87.0.4280.141
pkgrel=3
pkgdesc="A lightweight approach to removing Google web service dependency (binary AppImage)"
url='https://ungoogled-software.github.io/ungoogled-chromium-binaries/'
arch=('x86_64')
license=('BSD')
conflicts=('chromium')
options=(!strip) # needed for AppImage
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/LordTwix/${_pkgname}-binaries/releases/download/$pkgver-1.1/${_pkgname}_$pkgver-1.1_linux.AppImage"
        'ungoogled-chromium-icon.png'
        'chromium.desktop')
noextract=("${_pkgname}-${pkgver}.AppImage")
sha256sums=('c885438761076d8e17899de651e142dc7296423661aa7a9a5cd539b7e2a01a84'
            '6295a253024614ac64657e976983e02f010fda34c5fca4b08ef7add01bea043a'
            '576e5a93369b8396a1f6ae81ad1f057878aa912e3843f562bd9db12e75256782')
_filename=${_pkgname}-${pkgver}.AppImage

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}"
  install -Dm644 "${srcdir}/chromium.desktop" "${pkgdir}/usr/share/applications/chromium.desktop"
  install -Dm644 "${srcdir}/${_pkgname}-icon.png" "${pkgdir}/opt/${_pkgname}/${_pkgname}-icon.png"

  # Symlink in /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/appimages/${_filename}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "/opt/appimages/${_filename}" "${pkgdir}/usr/bin/chromium"
}
