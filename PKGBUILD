# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-connectorx
_pkgname=connector-x
pkgver=0.4.5
pkgrel=1
pkgdesc="Load data from databases into Python"
arch=('x86_64')
url="https://github.com/sfu-db/connector-x"
license=('MIT')
depends=('python')
checkdepends=()
optdepends=()
makedepends=(python-installer maturin patchelf rust)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sfu-db/connector-x/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('619e8ff23f75a60604681a80cef94ed8d2458e4c235c7ad0d041a202ade2bd56')
options=('!lto')

build(){
  cd "$_pkgname-$pkgver/connectorx-python"
  maturin build --release --strip --interpreter python
}

package(){
  cd "$_pkgname-$pkgver/connectorx-python"
  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

#check() {
  #local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  #python -m installer --destdir=test_dir "$srcdir/$_pkgname-$pkgver"/connectorx-python/target/wheels/*.whl
  #export PYTHONPATH="$srcdir/test_dir/$_site_packages:$PYTHONPATH"
  #export SQLITE_URL=sqlite:///test.db
  #pytest -vv "$srcdir/test_dir/$_site_packages/connectorx/tests"
#}

# vim:ts=2:sw=2:et:
