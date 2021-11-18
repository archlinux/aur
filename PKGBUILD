# Maintainer: Ian Young <ian at iangreenleaf dot com>

pkgname=gigalixir-cli
_name=gigalixir
pkgver=1.2.3
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
sha256sums=("1b7a9aed7e61a3828f5a11774803edc39358e2ac463b3b5e52af267f3420dc66")

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
