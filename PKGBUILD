# Maintainer: Ian Young <ian at iangreenleaf dot com>

pkgname=python-rollbar
_name=rollbar
pkgver=0.15.2
pkgrel=1
pkgdesc="Easy and powerful exception tracking with rollbar"
arch=(any)
url="https://rollbar.com/docs/notifier/pyrollbar/"
license=('MIT')
depends=('python-requests' 'python-six')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest-runner'
  'python-blinker'
  'python-webob')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  "unittest.patch")
sha256sums=("5e80fe7c9b15e84f5b72e45ebaa85bba1c13234e447a5f3801d094eb379c2d0e"
  "9842ace5f40a793ca513129ab7456093513405496da4a8bc6bdbf1d31d72933b")

prepare() {
  cd "$_name-$pkgver"
  patch --strip=1 < ../unittest.patch
}

check() {
  cd "$srcdir/$_name-$pkgver"
  pytest
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install -O1 --skip-build --root="$pkgdir"
}
