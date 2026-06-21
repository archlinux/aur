# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=ngram
pkgname=python-${_name}
pkgver=4.0.3
pkgrel=1
pkgdesc="A set subclass providing fuzzy search based on N-gram"
arch=('any')
url="https://github.com/gpoulter/python-ngram"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('06d1809ee2fedddced6065dcd19826c61318787d47bf4f10b1c011783d419aa6')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  #test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
