# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_name=qbittorrent-api
pkgname="python-$_name"
pkgver=2025.5.0
pkgrel=1
pkgdesc="Python client for qBittorrent v4.1+ Web API"
arch=('any')
url="https://pypi.org/project/$_name"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('34a0f9c1e1ae7e16de50e94651752c8d97a3cf54c2a3e1a05c6a8377399a0e30')
b2sums=('0129c1c19b83de6d5d3a4da67deeb02a8e5d38525e09fe83b43cf93bf58cbc3fffba36ad644c04c346f780a8813e5d1dcaec54d45b963d2cddb6358acb7cf6db')

build() {
  cd "${_name//-/_}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
