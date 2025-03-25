# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pyname=fastprogress
pkgname=python-$_pyname
pkgver=1.0.3
pkgrel=3
pkgdesc='Simple and flexible progress bar for Jupyter Notebook and console'
arch=(any)
url='https://github.com/fastai/fastprogress'
license=(Apache-2.0)
depends=(ipython python-matplotlib)
mmakedepends=(python-setuptools python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('419702fb678487ea92a83284450b7e1065d16385d7f97497521e27d46d4931bc')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}
