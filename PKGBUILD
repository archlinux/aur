# Maintainer: Pawel Krawczyk <https://aur.archlinux.org/account/kravietz>
# https://wiki.archlinux.org/title/Python_package_guidelines

pkgname=python-sigstore
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="sigstore is a tool for signing and verifying Python package distributions."
arch=('any')
url='https://pypi.org/project/sigstore/'
license=('Apache')
depends=(python python-requests python-pydantic python-pyopenssl python-securesystemslib python-pyjwt)
makedepends=(python-flit-core python-build python-installer python-wheel)
checkdepends=(python)
source=(https://github.com/sigstore/sigstore-python/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=(64ba8faaac92affacc50e4c86395d027b0933d8dbb2b1a92ffcb584ed7bcc3035660f4db307ff5871304c20395d6793c6dcbc592bc08b2bcc293cb0326d53028)

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
