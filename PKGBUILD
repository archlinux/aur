# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=safehttpx
pkgname=python-$_name
pkgver=0.1.7
pkgrel=2
pkgdesc='A small Python library created to help developers protect their applications from Server Side Request Forgery (SSRF) attacks.'
arch=('any')
url='https://github.com/gradio-app/safehttpx'
license=('Apache-2.0')
depends=('python' 'python-httpx')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('db201c0978c41eddb8bb480f3eee59dd67304fdd91646035e9d9a720049a9d23')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/$_name-$pkgver
  local pytest_options=(
    -vv
    --disable-warnings
  )
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" test/test.py
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
