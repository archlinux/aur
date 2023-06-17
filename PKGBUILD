# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp')
pkgver=1.2.2
pkgrel=1
pkgdesc="A pluggable framework for adding two-factor authentication to Django using one-time passwords"
url="https://github.com/django-otp/django-otp"
license=('Unlicense')
arch=('any')
optdepends=('python-qrcode: For OTP setup with QR code')
makedepends=('python-build' 'python-hatchling' 'python-installer')
depends=('python-django')
checkdepends=('python-freezegun' 'python-qrcode')
source=("${_name}-${pkgver}.tar.gz::https://github.com/${_name}/${_name}/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e6201c8131e07bbb4f41aeb9f5670c06573be63950d34ffa4d225fada503ee7bdf360609bd72b7f683567e149510abd5d50d4fd30bab107a32c9a0f5122cce6a')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/${_name}-${pkgver}"
  DJANGO_SETTINGS_MODULE="test_project.settings" \
  PYTHONPATH="test" \
  python -s -m django test django_otp
}

package() {

  cd "$srcdir/${_name}-${pkgver}/"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
