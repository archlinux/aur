# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_name=qbittorrent-api
pkgname="python-$_name"
pkgver=2024.9.67
pkgrel=1
pkgdesc="Python client for qBittorrent v4.1+ Web API"
arch=('any')
url="https://pypi.org/project/$_name"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('f8d7edb71b14ccd560d182fa1f450b7836ffc686ccbd4786c1663f7a037d6966')
b2sums=('d91af17b37395357cfb2d3786daa54ce2abbe9009c764f6daa34c2c5ab859ac13a1b951857f760126eabeaea1ba678b546236a72e2e60a307ab685170db49ce5')

build() {
  cd "${_name//-/_}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
