# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=qbittorrent-api
pkgname="python-$_pkgname"
pkgver=2023.11.55
pkgrel=1
pkgdesc="Python client for qBittorrent v4.1+ Web API"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-six' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rmartin16/qbittorrent-api/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('964467311c01392fe7a095899ea00d3f50a69d338db469091630f69e18458cdf')
b2sums=('26a0955e2900e5d133ac782b99e0a3eb7e184fa6a17d8e3b02c1dcd2615581becd912fc9d7b81d932445c7449274d3a161e7d0587335a8a8a927ea7f4509d112')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
