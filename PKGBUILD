# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=jiwer
pkgname=python-$_name
pkgver=4.0.0
pkgrel=2
pkgdesc='Evaluate your speech-to-text system with similarity measures such as word error rate (WER).'
arch=('any')
url='https://github.com/jitsi/jiwer'
license=('Apache-2.0')
depends=('python' 'python-click' 'python-rapidfuzz')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-benchmark')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ae9c051469102a61ef0927100baeeb4546f78d180c9b0948281d08eaf44c191e')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
