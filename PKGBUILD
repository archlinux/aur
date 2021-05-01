# Maintainer: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>

pkgname=mcstatus
pkgver=5.2.0
pkgrel=1
pkgdesc="Provides an easy way to query Minecraft servers for any information they can expose."
arch=(any)
url="https://github.com/Dinnerbone/mcstatus"
license=('Apache')
depends=(python python-six python-click python-dnspython python-asyncio-dgram)
makedepends=(python-setuptools)
checkdepends=(python-mock python-pytest python-pytest-asyncio)
source=("https://github.com/Dinnerbone/mcstatus/archive/v${pkgver}.tar.gz")
sha256sums=('c0c23f875e304e4d9e667ed0d8d3a0f0457e5d3f64ab273bcfccad3d2dc01fce')

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
