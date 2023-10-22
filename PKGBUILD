_pipname=Flask-Session2
pkgname=python-flask-session2
pkgver=1.3.1
pkgrel=1
pkgdesc='Adds server-side session support to your Flask application'
arch=(any)
url='https://pypi.org/project/flask-session2/'
license=(BSD)
depends=(python-flask python-cachelib python-pytz)
makedepends=(python-setuptools)
conflicts=(python-flask-session)
source=("https://pypi.io/packages/source/f/flask-session2/Flask-Session2-${pkgver}.tar.gz" "patch.patch")
sha256sums=('171e986d4e314795f448a527095e42df6abfba76c3e4ce5c8e4c61c857c59cb2' 'e68348f3d4612846af53348fc23281c65daa59183c297df986db937315977a8d')

prepare() {
  cd "$srcdir/${_pipname}-${pkgver}"
  # allow higher pytz and cachelib version
  patch -p0 -i ../patch.patch
}

build() {
  cd "$srcdir/${_pipname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pipname}-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

