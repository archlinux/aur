# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild [at] gadz [at] org>

pkgname=python-mlxtend
_name=${pkgname#python-}
pkgver=0.19.0
pkgrel=1
pkgdesc="Library of Python tools and extensions for data science"
arch=('any')
url="https://github.com/rasbt/mlxtend"
license=('BSD')
depends=(
  'python-joblib>=0.13.2'
  'python-matplotlib>=3.0.0'
  'python-numpy>=1.16.2'
  'python-pandas>=0.24.2'
  'python-scipy>=1.2.1')
makedepends=('python-setuptools')
# checkdepends=('python-pytest' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('e2112dc65a62703f634bb789e176779e68517f7bef4321ce56bee3b29c6f2388e13f7b468cd83ca2bde05ac93eb64e1ed379cfa36519119859b1f66d26533e4c')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

# check() {
#   cd "$_name-$pkgver"
#   python setup.py pytest
# }

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm 644 LICENSE-BSD3.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
