# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_upstreamver=1.7
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
sha256sums=('a967d30bdb03f30769919141c71cbad13fdeb1d829da80752b52983de980653d')

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
