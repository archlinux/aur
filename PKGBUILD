# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit_dht
_pypi_pkgname=Adafruit_DHT
pkgver=1.4.0
pkgrel=2
pkgdesc="Python library to read the DHT series of humidity and temperature sensors on a Raspberry Pi or Beaglebone Black."
url="https://github.com/adafruit/Adafruit_Python_DHT"
arch=('armv6h' 'armv7h')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/A/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('e927f2232eff5335cb9d8a2cca6dcad4625e61f205b12e31ef04198ea6dec830')

package() {
  cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
  if [ "$(grep AM33 /proc/cpuinfo)" != "" ]; then
    echo "Forcing build for beaglebone"
    python setup.py install --force-bbb --root="$pkgdir/" --optimize=1
  elif [ "$(grep ARMv6 /proc/cpuinfo)" != "" ]; then
    echo "Forcing build for Raspberry Pi V1"
    python setup.py install --force-pi --root="$pkgdir/" --optimize=1
  elif [ "$(grep ARMv7 /proc/cpuinfo)" != "" ]; then
    echo "Forcing build for Raspberry Pi 2/3/4"
    python setup.py install --force-pi2 --root="$pkgdir/" --optimize=1
  else
    echo "Autodetect platform"
    python setup.py install --root="$pkgdir/" --optimize=1
  fi
}

# vim:set ts=2 sw=2 et:
