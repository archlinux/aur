# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=safehttpx
pkgname=python-$_name
pkgver=0.2.0
pkgrel=1
pkgdesc='A small Python library created to help developers protect their applications from Server Side Request Forgery (SSRF) attacks.'
arch=('any')
url='https://github.com/gradio-app/safehttpx'
license=('Apache-2.0')
depends=('python'
         'python-httpx2')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bd698a5a1730777040ccfdac0aef7a7bdb10f59931796c4c99c003dc90dff281')

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
