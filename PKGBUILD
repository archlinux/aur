# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Giampaolo Mancini <giampaolo@trampolineup.com>

_pkgname=gpiozero
pkgname="python-${_pkgname}"
pkgver=1.5.1
pkgrel=2
pkgdesc='A simple interface to GPIO devices with Raspberry Pi'
arch=('any')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('BSD')
optdepends=(
    'python-spidev: for SPI access'
    'python-raspberry-gpio: for pin access via raspberry-gpio-python library'
)
depends=('python-colorzero' 'python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8cb9824fe1b08e7935de03899455e20ce2c242e4cebb0c954c274c48059f6ea5')


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
