# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-zope-testrunner
pkgver=5.5.1
pkgrel=1
pkgdesc="Zope testrunner script"
arch=('any')
url="https://github.com/zopefoundation/zope.testrunner"
license=('ZPL')
depends=('python38-setuptools' 'python38-zope-interface' 'python38-zope-exceptions' 'python38-six')
checkdepends=('python38-zope-testing' 'python38-zope-testrunner')
source=("https://github.com/zopefoundation/zope.testrunner/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1f25ce6b8a3c3fed43d95bfde2b359ebabac09c71fcfc9c751938f8bde5df5b67a86e8df6d4c3e915ce0b663485b29c195e73c0f574adcad75716eff4cdc51eb')

build() {
  cd zope.testrunner-$pkgver
  python3.8 setup.py build
}

check() {
  cd zope.testrunner-$pkgver
  python3.8 -m venv "$srcdir/pyvenv" --system-site-packages
  (
    . "$srcdir/pyvenv/bin/activate"
    python3.8 setup.py develop
    python3.8 setup.py test
  )
}

package() {
  cd zope.testrunner-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
