# Maintainer: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>

pkgname=mcstatus
pkgver=5.1.1
pkgrel=1
pkgdesc="Provides an easy way to query Minecraft servers for any information they can expose."
arch=(any)
url="https://github.com/Dinnerbone/mcstatus"
license=('Apache')
depends=(python python-six python-click python-dnspython python-asyncio-dgram)
makedepends=(python-setuptools)
checkdepends=(python-mock python-nose)
source=("https://github.com/Dinnerbone/mcstatus/archive/release-${pkgver}.tar.gz")
sha256sums=('20de89e1ec19ae3310c315702582392b99b3b9a83b0c8eee2637670ebbe16a7c')

prepare() {
  cd "${srcdir}/mcstatus-release-${pkgver}"

  sed -i 's/dnspython3/dnspython/' requirements.txt
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
