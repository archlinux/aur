# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild [at] gadz [at] org>

pkgname=python-mlxtend
_name=${pkgname#python-}
pkgver=0.20.0
pkgrel=1
pkgdesc="Library of Python tools and extensions for data science"
arch=('any')
url="https://github.com/rasbt/mlxtend"
license=('BSD' 'CCPL')
depends=(
  'python-joblib'
  'python-matplotlib'
  'python-numpy'
  'python-pandas'
  'python-scipy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9d27e8ca720eb4b8848bd1462d428742e4fe8beca94e03eb70e823207188a245')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "$_name-$pkgver"
#   pytest -x
# }

package() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/$_name-$pkgver.dist-info/LICENSE-BSD3.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-BSD3"
  ln -s \
    "$_site/$_name-$pkgver.dist-info/LICENSE-CC-BY.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-CC-BY"
}

# vim:set ts=2 sw=2 et:
