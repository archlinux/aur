# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp')
pkgver=1.2.4
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
sha512sums=('b4fc027798bbb2da5c845dcedd3df7a0beac136e2ee1542e3ad55652349b77fca79c62d7562dbf8c0820e04de28935ef915d2de50a8d9e43514078cc00a0bc1e')

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
