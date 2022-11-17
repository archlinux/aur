# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp')
pkgver=1.1.4
pkgrel=1
pkgdesc="A pluggable framework for adding two-factor authentication to Django using one-time passwords"
url="https://github.com/django-otp/django-otp"
license=('BSD')
arch=('any')
optdepends=('python-qrcode: For OTP setup with QR code')
makedepends=('python-setuptools')
depends=('python-django')
checkdepends=('python-tox')
source=("${_name}-${pkgver}.tar.gz::https://github.com/${_name}/${_name}/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6bf6fbb6fe274bb8cd5de1ae31fad2bcb019332d3b10faffcffcd1f68a1160dffc2093eaadfd684c91372522e0132198df00da9e8cd0249124fd7020d63b91c3')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "$srcdir/${_name}-${pkgver}"
  tox -e py310
}

package() {

  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
