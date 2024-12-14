# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_name=qbittorrent-api
pkgname="python-$_name"
pkgver=2024.11.70
pkgrel=1
pkgdesc="Python client for qBittorrent v4.1+ Web API"
arch=('any')
url="https://pypi.org/project/$_name"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('e14a8ead68591f2bb7f6917b68bbd950e1631604d2a5b4a55c52eb3cf396af30')
b2sums=('8b1ab8892ad98088e3b5336de3b7737cdad10e25cdbf57c701a54de8b1c1ed3238bdee75c2cc6e2880e0b46c9e81d316970f995e32f0690df940493167fb1f7e')

build() {
  cd "${_name//-/_}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
