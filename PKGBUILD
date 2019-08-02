# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Giampaolo Mancini <giampaolo@trampolineup.com>

pkgname=python-gpiozero
pkgver=1.5.1
pkgrel=1
pkgdesc='A simple interface to GPIO devices with Raspberry Pi'
arch=('any')
url="https://github.com/RPi-Distro/${pkgname}"
license=('BSD')
optdepends=(
    'python-spidev: for SPI access'
    'python-rpi.gpio: for Raspberry Pi GPIO pin access via RPi.GPIO library'
)
depends=('python-colorzero' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RPi-Distro/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8cb9824fe1b08e7935de03899455e20ce2c242e4cebb0c954c274c48059f6ea5')


build() {
  cd "${srcdir}/${pkgname//python-/}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname//python-/}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
