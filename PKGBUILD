# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=vdirsyncer
_pkgname=vdirsyncer
pkgver=0.11.0
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('any')
url="https://vdirsyncer.readthedocs.org/"
license=('MIT')
depends=('python-click' 'python-setuptools'
         'python-requests-toolbelt' 'python-atomicwrites'
         'python-click-threading' 'python-click-log')
optdepends=('python-requests-oauthlib: Remotestorage support')
checkdepends=('python-pytest' 'python-wsgi-intercept'
              'radicale' 'python-werkzeug' 'python-pytest-xprocess'
              'python-pytest-localserver' 'python-hypothesis'
              'python-pytest-subtesthack')
source=("https://pypi.io/packages/source/v/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('0bf68cc5e6a99f98a6e74c2ee0b48642')

check() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make test
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
