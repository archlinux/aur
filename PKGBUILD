# Maintainer: Ian Young <ian at iangreenleaf dot com>

pkgname=gigalixir-cli
_name=gigalixir
pkgver=1.2.2
pkgrel=1
epoch=
pkgdesc="CLI tool for Gigalixir hosting service"
arch=('any')
url="https://www.gigalixir.com/"
license=('MIT')
depends=('python'
  'python-click'
  'python-requests'
  'python-stripe'
  'python-rollbar'
  'python-pygments'
  'python-pyopenssl'
  'python-qrcode')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner'
  'python-httpretty'
  'python-sure')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("f1f54c6fd8eb1cb4a8c38bdb60d29358310e1686dbcf5169ec736a9d4eb52874")

check() {
  cd "$srcdir/$_name-$pkgver"
  GIGALIXIR_ENV=test python setup.py test
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
