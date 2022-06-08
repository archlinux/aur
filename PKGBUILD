# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgname=python-asyncclick
_name=${pkgname#python-}
pkgver=8.1.3.2
pkgrel=1
pkgdesc="Composable command line interface toolkit, async version"
arch=(any)
url="https://github.com/python-trio/asyncclick"
license=('BSD')
depends=(python python-anyio)
makedepends=(git python-setuptools python-setuptools-scm python-wheel)
checkdepends=(python-pytest python-trio)
optdepends=('python-trio: Alternative async event loop'
            'python-curio: Alternative async event loop')
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fe24de60f5bc8ef71b9b7011f1df7033e93e01e6775235d1b52458eedd69241e')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$PWD/src" pytest || :
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
