# Maintainer: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>

pkgname=mcstatus
pkgver=4.1.0
pkgrel=2
pkgdesc="Provides an easy way to query Minecraft servers for any information they can expose."
arch=(any)
url="https://github.com/Dinnerbone/mcstatus"
license=('Apache')
depends=(python python-six python-click python-dnspython)
makedepends=(python-setuptools)
checkdepends=(python-mock python-nose)
source=("https://github.com/Dinnerbone/mcstatus/archive/release-${pkgver}.tar.gz")
sha256sums=('21c3415ab1a0f68db3f8909566a945f6eeeca5ca8d0811dc5b4f2af3ee98c0b5')

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
