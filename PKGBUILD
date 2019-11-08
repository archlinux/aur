# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-rpi.gpio
pkgver=0.7.0
pkgrel=1
pkgdesc="A module to control Raspberry Pi GPIO channels"
url="http://sourceforge.net/projects/raspberry-gpio-python/"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/cb/88/d3817eb11fc77a8d9a63abeab8fe303266b1e3b85e2952238f0da43fed4e/RPi.GPIO-0.7.0.tar.gz"
        read-pin-base_new.patch
        cpuinfo-from-devicetree.patch)
sha512sums=('db838914a26dbc2083af16d5e5780b2f9b5c5e8c43a083556157964b032654e0f4942173ee933afa7169d1eca26e123410518328ae5729b6aaf8ac8f41996b01'
            'f0f9ae1ad760c667a1fa3e42fbcc46963bf8653a3f45c3c6a457c39cb35135f00a261214c4c8f009c81cc1336252fe8338e4e7e67828b0488f99c9718f0dc744'
            '93c8516a268b00639cf49555a74b8760a8103e549da8ecf65081d74add937111bf7d79b4d73f4f97f3f0b3acea3f410f2b6cc0d94e9c4c3a9b1e6a69cfe77c1c')

prepare () {
  cd "${srcdir}/RPi.GPIO-${pkgver}"

  # https://sourceforge.net/p/raspberry-gpio-python/tickets/149/
  patch -p1 -i "${srcdir}/cpuinfo-from-devicetree.patch"

  # https://sourceforge.net/p/raspberry-gpio-python/tickets/150/
  patch -p1 -i "${srcdir}/read-pin-base_new.patch"
}

build() {
  cd "${srcdir}/RPi.GPIO-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/RPi.GPIO-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
