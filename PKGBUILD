# Maintainer: googol <googol@posteo.de>
# Former Maintainer unknown (because the line in the PKGBUILD was accidentally removed).
pkgname=python2-alembic
pkgver=0.7.6
pkgrel=1
pkgdesc="A lightweight database migration tool for usage with SQLAlchemy"
arch=('any')
url="https://bitbucket.org/zzzeek/alembic"
license=('MIT')
groups=()
depends=('python2' 'python2-sqlalchemy' 'python2-mako')
source=(https://pypi.python.org/packages/source/a/alembic/alembic-${pkgver}.tar.gz)
        #https://pypi.python.org/packages/source/a/alembic/alembic-${pkgver}.tar.gz.asc)
sha256sums=('864fa461265d6c97bcefee603e9ef0b6385bda9063d41b3db3e010abbba5ef61')
            #'c1391272683e3ff178b4a87930a2e18fe348b3bb72703f75e5e9510e13042c48')

build() {
  cd "$srcdir"/alembic-${pkgver}
  python2 setup.py build
}

package() {
  cd "$srcdir"/alembic-${pkgver}
  python2 setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
  # Avoid conflicts between python2-alembic and python-alembic
  mv $pkgdir/usr/bin/alembic $pkgdir/usr/bin/alembic2
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

