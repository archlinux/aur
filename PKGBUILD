# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-localserver
pkgver=0.7.0
pkgrel=1
pkgdesc='py.test plugin to test server connections locally'
arch=('any')
license=('MIT')
url='https://bitbucket.org/pytest-dev/pytest-localserver'
depends=('python38-pytest' 'python38-werkzeug')
optdepends=('python38-aiosmtpd: for smtp')
makedepends=('python38-setuptools')
checkdepends=('python38-requests')
source=(https://files.pythonhosted.org/packages/source/p/pytest-localserver/pytest-localserver-$pkgver.tar.gz)
sha512sums=('1fb1acaeb190d35ebd05cdd63ce15e4a9138802901cef8c25c1fa6dd177d8af2b6b2749f5a052942bf655ffd2ff6105de8a652d73faab369ce6dcf3219bb2394')

build() {
  cd pytest-localserver-$pkgver
  python3.8 setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-localserver-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest
}

package() {
  cd pytest-localserver-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
