# Maintainer:  Johan Vandegriff <johan at vandymail dot com>

pkgname=streampi-client
pkgver=1.0.0_EA+3
_pkgver=1.0.0-EA+3
pkgrel=2
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
source=("${pkgname}-${pkgver}.zip::https://github.com/stream-pi/client/releases/download/${_pkgver}/stream-pi-client-linux-x64-${_pkgver}-executable.zip"
        'LICENSE::https://raw.githubusercontent.com/stream-pi/client/master/LICENSE')
sha256sums=('9b15a5e4003099e2ea5eb39f635c1eda9b638c06e181d58a9677a459cf2a46f8'
            '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')

package() {
  gendesk --pkgname "Stream-Pi Client" --pkgdesc "${pkgdesc}" --icon "/opt/streampi-client/lib/Stream-Pi Client.png" --exec "/usr/bin/${pkgname}" --categories "Application;Multimedia" -n -f
  install -D -m644 "${srcdir}/Stream-Pi Client.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -d "${pkgdir}/usr/bin" "${pkgdir}/opt"
  cp -avR "stream-pi-client-${_pkgver}" "${pkgdir}/opt/streampi-client"
  ln -sr "${pkgdir}/opt/streampi-client/bin/Stream-Pi Client" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
