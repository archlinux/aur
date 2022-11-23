# Maintainer: Pawel Krawczyk <https://aur.archlinux.org/account/kravietz>
# https://wiki.archlinux.org/title/Python_package_guidelines

pkgname=python-sigstore
_name=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="sigstore is a tool for signing and verifying Python package distributions."
arch=('any')
url='https://pypi.org/project/sigstore/'
license=('Apache')
depends=(python python-requests python-pydantic python-pyopenssl python-securesystemslib python-pyjwt)
makedepends=(python-flit-core python-build python-installer python-wheel)
checkdepends=(python)
source=(https://github.com/sigstore/sigstore-python/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('abfe3a831657661ce4cd934f15dcd7712b5490e0bf794ba17df16a68216a1e24')

build() {
  cd "sigstore-python-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "sigstore-python-$pkgver"
  #pytest
}

package() {
  cd "sigstore-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
