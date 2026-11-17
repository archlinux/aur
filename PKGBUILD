# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_name=qbittorrent-api
pkgname="python-$_name"
pkgver=2026.10.1
pkgrel=1
pkgdesc="Python client for qBittorrent v4.1+ Web API"
arch=('any')
url="https://pypi.org/project/$_name"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('70a66abf381170256240e188c825634849fd02eb2ec40bf6e157a2df8f5d484b')
b2sums=('b858c3961c78f199df638d257a1eaff7bb9e8e43a3024faba46fc82ec45046ce3047fcfd8807cc91e32ad8ff40d401c013a5cb572da083d1dc833c7da5eb1bd5')

build() {
  cd "${_name//-/_}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
