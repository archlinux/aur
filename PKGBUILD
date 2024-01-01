# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=(python-specklepy)
pkgver=2.17.17
pkgrel=1
pkgdesc="This is the start of the Python client for Speckle 2.0. It is currently quite nebulous and may be trashed and rebuilt at any moment! It is compatible with Python 3.6+."
arch=('x86_64' 'i686')
url="https://github.com/specklesystems/speckle-py"
license=('Apache')
depends=('python' 'python-pydantic' 'python-gql' 'python-aiohttp' 'python-appdirs' 'python-requests' 'python-websockets')
optdepends=()
makedepends=(python-build python-installer python-wheel)
provides=('python-specklepy')
conflicts=()
replaces=()
backup=()
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('8b932e2f7b1b57dcc43c6718bcef6e40')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  # Install license file
  cd "${srcdir}/$_name-$pkgver"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install python modules
  cd "${srcdir}/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

