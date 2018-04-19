pkgname=python-rpi.gpio
pkgver=0.6.3
pkgrel=3
pkgdesc="A module to control Raspberry Pi GPIO channels"
url="http://sourceforge.net/projects/raspberry-gpio-python/"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/e2/58/6e1b775606da6439fa3fd1550e7f714ac62aa75e162eed29dbec684ecb3e/RPi.GPIO-0.6.3.tar.gz"
        read-pin-base.patch
        cpuinfo-from-devicetree.patch)
sha256sums=('a5fc0eb5e401963b6c0a03650da6b42c4005f02d962b81241d96c98d0a578516'
            '72539b6246f8f6b1c792052c5d7078e3d171f0a7a3a01d81b59431fed7058fda'
            '436825c6601e9ba873092d0be3d76693570e610479523abd3e9b821ff42ea83c')

prepare () {
  cd "${srcdir}/RPi.GPIO-${pkgver}"

  # https://sourceforge.net/p/raspberry-gpio-python/tickets/149/
  patch -p1 -i "${srcdir}/cpuinfo-from-devicetree.patch"

  # https://sourceforge.net/p/raspberry-gpio-python/tickets/150/
  patch -p1 -i "${srcdir}/read-pin-base.patch"
}

build() {
  cd "${srcdir}/RPi.GPIO-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/RPi.GPIO-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
