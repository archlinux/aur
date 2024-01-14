# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=python3-msrplib
pkgname=python-msrplib
pkgver=0.21.1
pkgrel=3
pkgdesc="MSRP (RFC4975) client library"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-msrplib"
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=(
  'python-application'
  'python-eventlib'
  'python-gnutls'
  'python-twisted'
  'python-zope-interface'
  )
conflicts=('python3-msrplib')
provides=('python3-msrplib')
replaces=('python3-msrplib')
source=("http://download.ag-projects.com/SipSimpleSDK/Python3/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('ad9dd88bd40ed4df843765d733ad38bb3ee52445100a47181bac851d7f753ec06cbbf4c61ba31991bbd98856f6157dc871d4b03c56a159669cddc2518060a5f6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
