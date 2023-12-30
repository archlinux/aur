# Maintainer: Igor Saric <karabaja4 at gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Giampaolo Mancini <giampaolo@trampolineup.com>

_pkgname=gpiozero
pkgname="python-${_pkgname}"
pkgver=2.0
pkgrel=1
pkgdesc='A simple interface to GPIO devices with Raspberry Pi'
arch=('any')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('BSD')
optdepends=(
    'python-spidev: for SPI access'
    'python-rpi-gpio: for pin access via raspberry-gpio-python library'
)
depends=('python-colorzero' 'python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c57d9c81854f72ab54351d72fa1e6b2e4bc1ff56c57422c30772d271824e1916')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
