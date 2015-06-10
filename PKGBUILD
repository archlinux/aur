# Contributor: Ben Alex <ben.alex@acegi.com.au>
# https://github.com/benalexau/rpi-gpio-ntp-aur

pkgname=rpi-gpio-ntp
pkgver=1.5
pkgrel=2
pkgdesc="Raspberry Pi GPIO PPS NTP Receiver"
arch=('any')
url="http://vanheusden.com/time/rpi_gpio_ntp/"
license=GPL2
depends=()
makedepends=('make' 'gcc')
backup=('etc/rpi-gpio-ntp.conf')
source=('http://vanheusden.com/time/rpi_gpio_ntp/rpi_gpio_ntp-1.5.tgz'
        'rpi-gpio-ntp.conf'
	'rpi-gpio-ntp.service')
md5sums=('fbb99cd1481121b216bb0e6f7c6ba1b9'
         'a44541e3253bc112ba55a76646ae7c0b'
         'df78058ea1378fe400f4b47b4e06cae2')

build() {
  cd ${srcdir}/rpi_gpio_ntp-${pkgver}
  sed -i 's/\tset_prio/\t\/\/set_prio/' main.c
  make
}

package() {
  install -Dm755 ${srcdir}/rpi_gpio_ntp-${pkgver}/rpi_gpio_ntp ${pkgdir}/usr/bin/rpi_gpio_ntp
  install -Dm644 ${srcdir}/rpi-gpio-ntp.conf ${pkgdir}/etc/rpi-gpio-ntp.conf
  install -Dm644 ${srcdir}/rpi-gpio-ntp.service ${pkgdir}/usr/lib/systemd/system/rpi-gpio-ntp.service
}
