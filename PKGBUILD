# Maintainer  : Balazs Vinarz <vinibali1@gmail.com

pkgname='domoticz-bin'
pkgver=2023.2
pkgrel=3
pkgdesc="Web based home automation"
arch=('armv7h' 'aarch64' 'x86_64')
url='https://www.domoticz.com'
conflicts=('domoticz' 'domoticz-git')
license=('GPL3')
depends=('libusb-compat' 'libcurl-gnutls' 'mosquitto')
install='domoticz.install'
get_arch_string() {
local arch="$1"
case "$arch" in
  armv7h)
  echo armhf
  ;;
  *)
  echo "$arch"
  ;;
esac
}
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/domoticz/domoticz/releases/download/${pkgver}/domoticz_linux_${pkgver}_$(get_arch_string $arch).tgz"
        'domoticz.service')
sha256sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/opt/domoticz"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${srcdir}/domoticz.service" "${pkgdir}/usr/lib/systemd/system/"
  mv "${srcdir}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -aRP "${srcdir}/*" "${pkgdir}/opt/domoticz"
  rm "${pkgdir}/opt/domoticz/${pkgname}-${pkgver}.tar.gz"
  chown -R http:http "${pkgdir}/opt/domoticz"
}
