# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pytest-check
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=1.0.4
pkgrel=2
pkgdesc="Pytest plugin that allows multiple failures per test"
arch=('any')
url="https://github.com/okken/pytest-check"
license=('MIT')
depends=('python' 'python-pytest')
makedepends=('python-build' 'python-pip' 'python-flit-core')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('9e779f2912dd0de989ec0ee1d588be23bfbdcfbf7fc7ab58d4387622d84332266bd0b39415f6560be83c0a0e25d6eec3bfb2d54360b26ba1b96a06e7cf755fda')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$_name-$pkgver"

  PIP_CONFIG_FILE=/dev/null pip install \
    --isolated \
    --root="$pkgdir" \
    --ignore-installed \
    --no-deps \
    dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
