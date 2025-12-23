# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_upstreamver='1.4'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='clox'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A Geeky Clock for Terminal Enthusiasts"
arch=('any')
url='https://github.com/sepandhaghighi/clox'
license=('MIT')
depends=('python' 'python-pytz' 'python-art' 'python-pytz' 'python-jdatetime' 'python-jalali-core')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-pydocstyle' 'bandit' 'vulture')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('03c18563551471b8b5385a7f9eae8e75b0bcf76542130b4acac40b1ca4591917')

build() {
  cd "$_pypi_package-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pypi_package-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  cd ..
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
