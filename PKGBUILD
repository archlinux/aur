# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp')
pkgver=1.1.6
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
sha512sums=('58c64651a5b274542bf09604daf3e59fdb0ea4eb96e7d14e59fd10a042d86cffb5df462191198f12320ea706f4d9aa651ef2c79ad7aa33e9d4ba0d157d90f4fb')

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
