# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp')
pkgver=1.1.3
pkgrel=2
pkgdesc="A pluggable framework for adding two-factor authentication to Django using one-time passwords"
url="https://github.com/django-otp/django-otp"
license=('BSD')
arch=('any')
optdepends=('python-qrcode: For OTP setup with QR code')
makedepends=('python-setuptools')
depends=('python-django')
checkdepends=('python-tox')
source=("${_name}-${pkgver}.tar.gz::https://github.com/${_name}/${_name}/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4e8b38c393fe29b2fa91e3f1f70abd2cc671dcf760e2e2bf8f738e04fc43a6e7f54229f298f7f2611988dffc40b4450ed1ab910ce9e9995b205dff1b3c90a977')

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
