# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python2-vdirsyncer
_pkgname=vdirsyncer
pkgver=0.9.0
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('any')
url="https://vdirsyncer.readthedocs.org/"
license=('MIT')
depends=('python2-click' 'python2-setuptools' 'python2-lxml'
         'python2-requests-toolbelt' 'python2-atomicwrites'
         'python2-click-threading' 'python2-click-log')
optdepends=('python2-requests-oauthlib: Remotestorage support')
checkdepends=('python2-pytest' 'python2-wsgi-intercept'
              'python2-radicale' 'python2-werkzeug-git'
              'python2-pytest-xprocess' 'python2-pytest-localserver'
              'python2-hypothesis')
source=("https://pypi.python.org/packages/source/v/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('af3d676341526e40b7191d28a0b95027')

check() {
  cd "$srcdir/${_pkgname}-$pkgver"
  sed -i 's/py.test/py.test2/g' build.sh
  DAV_SERVER=skip REMOTESTORAGE_SERVER=skip python setup.py test
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/usr/bin/vdirsyncer" "$pkgdir/usr/bin/vdirsyncer2"
}
