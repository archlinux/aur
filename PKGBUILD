# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=streampi-server
pkgver=0.0.6
pkgrel=1
pkgdesc='An Opensource Alternative to the Elgato Stream Deck for the Raspberry Pi'
arch=('x86_64')
url='https://stream-pi.com'
license=('MIT')
depends=('java-runtime>=11'
         'ttf-roboto'
         'libnet'
         'gtk3'
         'gtk2')
source=("${pkgname}-${pkgver}.zip::https://github.com/dubbadhar/streampi_server/releases/download/${pkgver}/linux64.zip"
        'LICENSE::https://github.com/dubbadhar/streampi_server/raw/master/LICENSE')
sha256sums=('9b171b41a4060430f3251856f6024e2b4cba328c829fe864dc908cbcf380a17c'
            '9cf04e2ea376310dc9957385a2151dad13150abbba0f01084f5b0324307519ae')

package() {
  install -d "${pkgdir}/usr/bin" "${pkgdir}/opt"
  cp -avR linux64 "${pkgdir}/opt/streampi-server"
  echo "#!/usr/bin/env bash
  cd /opt/streampi-server
  ./server.sh" > streampi-server
  install -Dm755 streampi-server -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
