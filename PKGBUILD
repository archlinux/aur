# Maintainer: Benjamin Trigona-Harany <arch@jaxartes.net>

_name=plpygis
pkgname=python-$_name
pkgver=0.4.2
pkgrel=1
pkgdesc="PL/Python for PostGIS"
arch=('any')
url="https://github.com/bosth/plpygis/"
license=('GPL-3.0-only')
depends=('python')
optdepends=('python-shapely: interoperability with Shapely geometries')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/bosth/$_name/archive/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('a4e00224288161251b9d17dad0d855ed908f7e6bb12f16a27c272f05ab1c0b3e')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
