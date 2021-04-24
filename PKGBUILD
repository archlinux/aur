# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=python-sqlalchemy1.3
pkgver=1.3.23
pkgrel=1
arch=('x86_64')
url="https://www.sqlalchemy.org/"
license=('MIT')
pkgdesc='Python SQL toolkit and Object Relational Mapper'
depends=('python')
optdepends=('python-psycopg2: connect to PostgreSQL database')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-xdist' 'python-mock')
source=("https://pypi.io/packages/source/S/SQLAlchemy/SQLAlchemy-$pkgver.tar.gz"{,.asc})
validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')
sha512sums=('dcd1a0878fd58ee49691bb7e8a2571cb40cc942380a4fe0e66d3abb1723830f178e7b3944c5c2d69bd3aaff04cd2ca171bbabbe34f59f54bcf4b9ee2782f9570'
            'SKIP')

prepare() {
  sed -i '/warnings.filterwarnings("error", category=DeprecationWarning)/a \    warnings.filterwarnings("ignore", category=DeprecationWarning, message="Creating a LegacyVersion has been deprecated and will be removed in the next major release")' \
      SQLAlchemy-$pkgver/lib/sqlalchemy/testing/warnings.py
}

build() {
  cd "$srcdir"/SQLAlchemy-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/SQLAlchemy-$pkgver
  python setup.py pytest
}

package() {
  cd SQLAlchemy-$pkgver
  python setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
