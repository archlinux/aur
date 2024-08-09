# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=cp210x-program
pkgver=0.4.1
pkgrel=1
pkgdesc='EEPROM tool for Silabs CP210x USB-Serial adapter'
url='https://github.com/VCTLabs/cp210x-program'
license=('LGPL-2.1-only')
arch=('any')
depends=('python' 'python-pyusb')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/python-smpplib/python-smpplib/archive/refs/tags/${pkgver}.tar.gz")
source=("https://github.com/VCTLabs/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a642314c8b6409a67e08a549bf2e884cd550f386c17ae31a1fe14467ab615261')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # rename the main binary (drop '.py')
  mv "${pkgdir}/usr/bin/cp210x-program.py" "${pkgdir}/usr/bin/cp210x-program"
  # install udev rules
  install -Dm 644 doc/45-cp210x-programming.rules \
                  "${pkgdir}/etc/udev/rules.d/cp210x-program.rules"
}

# vim:set ts=2 sw=2 et:
