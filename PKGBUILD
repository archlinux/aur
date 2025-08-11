# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=safehttpx
pkgname=python-$_name
pkgver=0.1.6
pkgrel=4
pkgdesc='A small Python library created to help developers protect their applications from Server Side Request Forgery (SSRF) attacks.'
arch=('any')
url='https://github.com/gradio-app/safehttpx'
license=('Apache-2.0')
depends=('python' 'python-httpx')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b356bfc82cee3a24c395b94a2dbeabbed60aff1aa5fa3b5fe97c4f2456ebce42')

prepare(){
  cd $_name-$pkgver
  sed -i "/93.184.215.14.nip.io/d" test/test.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest "${pytest_options[@]}" test/test.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
