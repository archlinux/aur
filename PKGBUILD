# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>

pkgname=mcstatus
pkgver=2.2
pkgrel=1
pkgdesc="Provides an easy way to query Minecraft servers for any information they can expose."
arch=(any)
url="https://github.com/Dinnerbone/mcstatus"
license=('Apache')
depends=(python python-six python-click python-dnspython)
makedepends=(python-setuptools)
checkdepends=(python-mock python-nose)
source=("https://github.com/Dinnerbone/mcstatus/archive/release-${pkgver}.tar.gz")
sha256sums=('489b85ea4ff49efdd94d890b6408368556f63df9bc9f0a4d5dced13ece64e265')

prepare() {
  cd "${srcdir}/mcstatus-release-${pkgver}"

  sed -i 's/dnspython3/dnspython/' setup.py
}


build() {
  cd "${srcdir}/mcstatus-release-${pkgver}"

  python setup.py build
}

check() {
  cd "${srcdir}/mcstatus-release-${pkgver}"

  nosetests
}

package() {
  cd "${srcdir}/mcstatus-release-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
