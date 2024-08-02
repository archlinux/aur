# Maintainer: Igor Saric <karabaja4 at gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Giampaolo Mancini <giampaolo@trampolineup.com>

_pkgname=gpiozero
pkgname="python-${_pkgname}"
pkgver=2.0.1
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
sha256sums=('971fa2023816f2c4f6cc28048bc2256ccda6c14a7ebc573b4c4eba6bdcd235fb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
