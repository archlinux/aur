# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp' 'python2-django-otp')
pkgver=0.5.2
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
sha256sums=('5756050ec09ecf8e6ce2b0f9f370ebd26249f326a1010a413b61c6a4c554f25f'
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
