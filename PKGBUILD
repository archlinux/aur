# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp' 'python2-django-otp')
pkgver=0.5.1
pkgrel=2
pkgdesc="A framework for adding two-factor authentication to Django using one-time passwords"
url="https://bitbucket.org/psagers/django-otp"
license=('BSD')
arch=('any')
optdepends=('python-qrcode: For OTP setup with QR code')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_name}/${_name}-$pkgver.tar.gz"
        "${_name}-${pkgver}.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_name}/${_name}-$pkgver.tar.gz.asc")
validpgpkeys=('21024EE045D76BF8758F7A5B8B14DEF5236837D8')
sha256sums=('529f936e9b6acbb011ac575d2e7e1a6c823661627ebcb314c11cd721237da433'
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
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-django-otp() {
  depends=('python2' 'python2-django' )
  cd "$srcdir/${_name}-${pkgver}-py2/"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
