# Maintainer: Michaël Serpieri <mickybart@pygoscelis.org>

pkgname=hybris-usb
pkgver=0.1
pkgrel=3
pkgdesc="USB control for Android with hybris"
arch=('armv7h' 'aarch64')
url=""
license=('custom')
provides=()
depends=('systemd' 'dhcp')
options=()
source=('usb-tethering'
	'usb-tethering.service'
	'dhcpd.conf'
	'dhcpd4.service-customexec.conf'
	'tmpfiles.d.hybris-usb.conf')
md5sums=('2d270508c91e94997236e5dacd7bbc8d'
         '7976b6c3d662802cc54e3458ec3b891e'
         '8d25b1c3f1146635800db77f300b908c'
         '0aff78dea49297c615946ee310c49a6b'
         '91422a3f2a69c9800d25cd65358fe5df')

build() {
  cd "${srcdir}"

}

package() {
  cd "${srcdir}"

  # usb tethering

  install -d ${pkgdir}/usr/bin
  install -m 755 usb-tethering ${pkgdir}/usr/bin/

  install -d ${pkgdir}/usr/lib/systemd/system/
  install -m 644 usb-tethering.service ${pkgdir}/usr/lib/systemd/system/

  # dhcpd configuration

  install -d ${pkgdir}/usr/lib/tmpfiles.d/
  install -m 644 tmpfiles.d.hybris-usb.conf ${pkgdir}/usr/lib/tmpfiles.d/hybris-usb.conf

  install -d ${pkgdir}/etc/systemd/system/dhcpd4.service.d/
  install -m 644 dhcpd4.service-customexec.conf ${pkgdir}/etc/systemd/system/dhcpd4.service.d/customexec.conf

  install -d ${pkgdir}/etc/hybris-usb/
  install -m 644 dhcpd.conf ${pkgdir}/etc/hybris-usb/
}

