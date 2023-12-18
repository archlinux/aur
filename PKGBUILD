# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Maintainer: taotieren <admin@taoieren.com>

pkgbase=python-pyexecjs
_name=PyExecJS2
pkgname=('python-pyexecjs')
pkgver=1.6.1
pkgrel=25
pkgdesc="Run JavaScript code from Python."
arch=('any')
url="https://pypi.python.org/pypi/PyExecJS2"
license=('MIT')
provides=("${pkgbase}" "python-pyexecjs2")  
conflicts=("${pkgbase}")
depends=('python-six')
makedepends=('python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
checkdepends=('python-six')
optdepends=('v8: Google JavaScript engine'
            'nodejs: built on Chrome V8 JavaScript engine'
            'phantomjs: a headless WebKit'
            'js115: Mozilla JavaScript engine (spidermonkey)')
changelog=changelog
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('bf8edafa419ff988e61e30ac9946eb3a7c066a1ec07d0c5b0b82b56f16b99050')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-$pkgver"
  LC_CTYPE=en_US.utf8 python test_execjs.py || warning "Tests failed"
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
