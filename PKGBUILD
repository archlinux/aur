# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp' 'python2-django-otp')
pkgver=0.7.3
pkgrel=1
pkgdesc="A pluggable framework for adding two-factor authentication to Django using one-time passwords"
url="https://github.com/django-otp/django-otp"
license=('BSD')
arch=('any')
optdepends=('python-qrcode: For OTP setup with QR code')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha512sums=('affb9350db71ac9a7ece68276b1cc91e3b128eedf45081d1f589f573e47e99b6afc08e63ed68a3e33f76a6bfdcad6ad9096c8db466a12fa793f383277ceef622')

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
