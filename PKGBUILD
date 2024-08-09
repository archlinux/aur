# Maintainer: Benjamin Trigona-Harany <arch@jaxartes.net>

_name=plpygis
pkgname=python-$_name
pkgver=0.5.2
pkgrel=1
pkgdesc="PL/Python for PostGIS"
arch=('any')
url="https://github.com/bosth/plpygis/"
license=('GPL-3.0-only')
depends=('python')
optdepends=('python-shapely: interoperability with Shapely geometries')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/bosth/$_name/archive/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('5b8af44e617d81aa44d1555f3e1dfc086e09d3fe47cff60143d33556e5e8ac8d')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
