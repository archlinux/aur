# Maintainer:  Johan Vandegriff <johan at vandymail dot com>

pkgname=streampi-server
pkgver=1.0.0_EA+3
_pkgver=1.0.0-EA+3
pkgrel=4
pkgdesc='An Opensource Alternative to the Elgato Stream Deck for the Raspberry Pi'
arch=('x86_64')
url='https://stream-pi.com'
license=('GPL3')
makedepends=('gendesk')
depends=('java-runtime>=11'
         'alsa-lib'
         'libnet'
         'gtk3'
         'gtk2')
source=("${pkgname}-${pkgver}.zip::https://github.com/stream-pi/server/releases/download/${_pkgver}/stream-pi-server-linux-x64-${_pkgver}-executable.zip"
        'LICENSE::https://raw.githubusercontent.com/stream-pi/server/master/LICENSE')
sha256sums=('ee16c0aff017260608a7fbc299449bf9a9e3d7c18f3c33ee8eb2745f94112e75'
            '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')

package() {
  gendesk --pkgname "Stream-Pi Server" --pkgdesc "${pkgdesc}" --icon "/opt/streampi-server/lib/Stream-Pi Server.png" --exec "/usr/bin/${pkgname}" --categories "Application;Multimedia" -n -f
  install -D -m644 "${srcdir}/Stream-Pi Server.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -d "${pkgdir}/usr/bin" "${pkgdir}/opt"
  cp -avR "stream-pi-server-${_pkgver}" "${pkgdir}/opt/streampi-server"
  ln -sr "${pkgdir}/opt/streampi-server/bin/Stream-Pi Server" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
