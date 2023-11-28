# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp')
pkgver=1.3.0
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
sha512sums=('d03e478146032db5d80e034dcd092763a5239cdaee989283a63370722ab2d04ac149761ddb920a5d1e5ddf86088bb559b6179e125d835d06388211fa6495765d')

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
