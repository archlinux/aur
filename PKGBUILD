# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=qbittorrent-api
pkgname="python-$_pkgname"
pkgver=2023.2.43
pkgrel=1
pkgdesc="Python client for qBittorrent v4.1+ Web API"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-six')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rmartin16/qbittorrent-api/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('192d39373536494c36497b307cef9a3eac69b6a7dab4c51df2192d13fc396681')
b2sums=('8a9e1491659bb46e95154debb00d02ffcaa1b736af31358267ae3b1a666167e30e78ff2d9306fc7e7484ee446a09a820d1f12fd04fe45ae521fb4f7b1139633c')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
