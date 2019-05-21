# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp' 'python2-django-otp')
pkgver=0.6.0
pkgrel=1
pkgdesc="A framework for adding two-factor authentication to Django using one-time passwords"
url="https://bitbucket.org/psagers/django-otp"
license=('BSD')
arch=('any')
optdepends=('python-qrcode: For OTP setup with QR code')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz"
        "${_name}-${pkgver}.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz.asc")
validpgpkeys=('21024EE045D76BF8758F7A5B8B14DEF5236837D8')
sha512sums=('c532ceab88d65bf3a5de3417c51505835fdf03c2d12ab47c0df4183d12288d49ee5da687df23ae819a71e5a2e93bc4ca2e2357486a10a8dc83861953dace212a'
            'SKIP')

prepare() {
  cp -a ${_name}-$pkgver{,-py2}
}

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build

  cd "$srcdir/${_name}-${pkgver}-py2"
  python setup.py build
}

package_python-django-otp() {
  depends=('python' 'python-django' )
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-django-otp() {
  depends=('python2' 'python2-django' )
  cd "$srcdir/${_name}-${pkgver}-py2/"
  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
