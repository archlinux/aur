# Maintainer: Pawel Krawczyk <https://aur.archlinux.org/account/kravietz>
# https://wiki.archlinux.org/title/Python_package_guidelines

pkgname=python-sigstore
_name=${pkgname#python-}
pkgver=0.6.8
pkgrel=1
pkgdesc="sigstore is a tool for signing and verifying Python package distributions."
arch=('any')
url='https://pypi.org/project/sigstore/'
license=('Apache')
depends=(python python-requests python-pydantic python-pyopenssl python-securesystemslib python-pyjwt)
makedepends=(python-flit-core python-build python-installer python-wheel)
checkdepends=(python)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('578d3e5ce18701d229ac22bc8aa839fabb19af1d4cf50960c6d089ab8e7c5f55')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  #pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
