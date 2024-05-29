# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

_pyname=ebaysdk
pkgname=python-$_pyname
_pkgname=$_pyname-python
pkgver=2.2.0
pkgrel=4
pkgdesc="eBay SDK for Python"
url="https://github.com/timotheus/ebaysdk-python"
arch=(any)
license=(CDDL)
depends=(python-lxml python-requests)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aaf2b04deb504676deaa9915f0993d37f5fd883929b6247d35f13654f6fa9594')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  rm -r "$pkgdir"/usr/lib/python*/site-packages/{samples,tests}
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
