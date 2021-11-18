# Maintainer: Ian Young <ian at iangreenleaf dot com>

pkgname=gigalixir-cli
_name=gigalixir
pkgver=1.2.4
pkgrel=1
epoch=
pkgdesc="CLI tool for Gigalixir hosting service"
arch=('any')
url="https://www.gigalixir.com/"
license=('MIT')
depends=('python'
  'python-click'
  'python-cryptography'
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
sha256sums=("894b7e5bef30abc2c003e6df47f7758de5649b6f593e33926fcd398cc88d9ce2")


prepare() {
  cd "$_name-$pkgver"
  sed -e 's/cryptography==3.4.8/cryptography/g' -i setup.py
}

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
