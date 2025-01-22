# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_name=qbittorrent-api
pkgname="python-$_name"
pkgver=2024.12.71
pkgrel=1
pkgdesc="Python client for qBittorrent v4.1+ Web API"
arch=('any')
url="https://pypi.org/project/$_name"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('4bb62ac075826d47529de562896bd97fe8527d2f55851ac3611d7b221c4507e2')
b2sums=('b6e1fcf4ffc0f82024de94a8136023d58ef799e5299593dcac3b6caff1e2052a9bb9dc36942296f473c006723647040a03b03d4bc9d466e1772dc5f9234d12f2')

build() {
  cd "${_name//-/_}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
