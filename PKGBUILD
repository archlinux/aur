# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=clickhouse-plantuml
_pyname=${_name//-/_}
pkgname="python-${_name}"
pkgver=0.3.0
pkgrel=1
pkgdesc='Generates PlantUML diagrams for ClickHouse databases'
arch=('any')
url='https://github.com/Felixoid/clickhouse-plantuml'
license=(Apache-2.0)
depends=(python plantuml)
makedepends=(python-build python-installer python-hatchling)
checkdepends=()
provides=(clickhouse-plantuml)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/03/8a/1abb58415c7d621edd75fe86c071f069dd5e1ab55990cace3dd9bd54a51a/$_pyname-$pkgver.tar.gz")
sha256sums=(e25ab319e85c282e6b26be0c74ef4190c0fe0cb37b225899261d962406d07dc2)

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m unittest discover -s tests/
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}
