# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=jiwer
pkgname=python-${_name}
pkgver=4.0.0
pkgrel=1
pkgdesc='Evaluate your speech-to-text system with similarity measures such as word error rate (WER).'
arch=('any')
url='https://github.com/jitsi/jiwer'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ae9c051469102a61ef0927100baeeb4546f78d180c9b0948281d08eaf44c191e')
depends=('python' 'python-click' 'python-rapidfuzz')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-benchmark')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
