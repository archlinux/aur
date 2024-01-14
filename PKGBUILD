# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=python3-otr
pkgname=python-otr
pkgver=2.0.1
pkgrel=4
pkgdesc="Off-The-Record Messaging protocol implementation for Python"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-otr"
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=(
  'python-application'
  'python-cryptography'
  'python-gmpy2'
  'python-zope-interface'
  )
conflicts=('python3-otr')
provides=('python3-otr')
replaces=('python3-otr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AGProjects/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('3fc0a49b30e752f77be7533744a418a8471486a2860f50b7d9157f2bc25fe593cf4b486ae856cb3944695f61466a87e1ca34cdaf48eea7ef9ba2feaef78332c7')

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
