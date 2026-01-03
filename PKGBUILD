# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=python3-otr
pkgname=python-otr
pkgver=2.1.0
pkgrel=1
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
sha512sums=('cfa73bc21e8b98f96cb83c87fc279f16b461b18cca3a6e0cc64b6295d627190415f75cff7b1e50c39f49636f4e48b1b428219d54bf3bf676018d10aa8f61ca1c')

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
