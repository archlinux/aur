# Maintainer: googol <googol@posteo.de>
# Former Maintainer unknown (because the line in the PKGBUILD was accidentally removed).
pkgname=python2-alembic
pkgver=0.8.9
pkgrel=1
pkgdesc="Alembic is a lightweight database migration tool for usage with the SQLAlchemy Database Toolkit for Python 2."
arch=('any')
url="https://bitbucket.org/zzzeek/alembic"
license=('MIT')
depends=('python2' 'python2-sqlalchemy' 'python2-mako' 'python2-editor')
source=(https://pypi.io/packages/source/a/alembic/alembic-${pkgver}.tar.gz
        https://pypi.io/packages/source/a/alembic/alembic-${pkgver}.tar.gz.asc)


sha256sums=('0932bed55a4546b8aa6f59b8ad8b92b0161e7bd46adc538d50afb1c96b3571c1'
            'SKIP')
# Developers key: https://projects.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/python-sqlalchemy
validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')

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
