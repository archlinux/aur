# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=(python-specklepy)
pkgver=2.19.6
pkgrel=1
pkgdesc="The Python SDK for Speckle 2.0"
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
md5sums=('d7d32a3532195007c3f23fc70ad169a5makepkg')

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

