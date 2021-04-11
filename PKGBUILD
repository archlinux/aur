# Maintainer: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>

pkgname=mcstatus
pkgver=5.1.4
pkgrel=1
pkgdesc="Provides an easy way to query Minecraft servers for any information they can expose."
arch=(any)
url="https://github.com/Dinnerbone/mcstatus"
license=('Apache')
depends=(python python-six python-click python-dnspython python-asyncio-dgram)
makedepends=(python-setuptools)
checkdepends=(python-mock python-pytest python-pytest-asyncio)
source=("https://github.com/Dinnerbone/mcstatus/archive/v${pkgver}.tar.gz")
sha256sums=('b090b5bdef6ff5e4d0eb03bb4ea939c8a93224fe8642a3d5fcc7b50e7fdcad85')

prepare() {
  cd "${srcdir}/mcstatus-${pkgver}"

  sed -i 's/dnspython3/dnspython/' requirements.txt
}


build() {
  cd "${srcdir}/mcstatus-${pkgver}"

  python setup.py build
}

check() {
  cd "${srcdir}/mcstatus-${pkgver}"

  python -m pytest
}

package() {
  cd "${srcdir}/mcstatus-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
