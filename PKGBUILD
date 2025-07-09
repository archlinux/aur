# Maintainer: Benjamin Trigona-Harany <arch@jaxartes.net>

_name=plpygis
pkgname=python-$_name
pkgver=0.5.5
pkgrel=1
pkgdesc="PL/Python for PostGIS"
arch=('any')
url="https://github.com/bosth/plpygis/"
license=('GPL-3.0-only')
depends=('python')
optdepends=('python-shapely: interoperability with Shapely geometries')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/bosth/$_name/archive/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('3f6a5fe1ce96baabbe80f5dbd155f0594fe65f902fca1243366774ba0eba325a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
