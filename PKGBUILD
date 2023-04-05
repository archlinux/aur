# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-connectorx
_pkgname=connector-x
pkgver=0.3.2.alpha2
pkgrel=1
pkgdesc="Load data from databases into Python"
arch=('x86_64')
url="https://github.com/sfu-db/connector-x"
license=('MIT')
depends=('python')
checkdepends=()
optdepends=()
makedepends=(python-installer maturin rust)
source=("git+https://github.com/sfu-db/connector-x.git#commit=0c16d98b270009b9594")
#"$_pkgname-$pkgver.tar.gz::https://github.com/sfu-db/connector-x/archive/refs/tags/v$pkgver.tar.gz"
sha256sums=('SKIP')

build(){
  cd "$_pkgname/connectorx-python"
  maturin build --release --strip --interpreter python
}

package(){
  cd "$_pkgname/connectorx-python"
  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

#check() {
  #local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  #cd "$_pkgname/connectorx-python"
  #python -m installer --destdir=test_dir target/wheels/*.whl
  #export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  #pytest -vv connectorx/tests
#}

# vim:ts=2:sw=2:et:
