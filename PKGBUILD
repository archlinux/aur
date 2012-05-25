# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: bekks <eduard.warkentin@gmx.de>

pkgname=pgadmin3-testing
pkgver=1.16.0beta1
_realver=1.16.0-beta1
pkgrel=1
pkgdesc="A comprehensive design and management interface for PostgreSQL database"
arch=('i686' 'x86_64')
url="http://www.pgadmin.org/"
license=('custom:PostgreSQL')
depends=('wxgtk' 'postgresql-libs' 'libxslt')
makedepends=('libpqxx' 'postgresql')
provides=('pgadmin3')
conflicts=('pgadmin3' 'pgadmin3-svn')
source=(http://ftp.postgresql.org/pub/pgadmin3/release/v${_realver}/src/pgadmin3-${_realver}.tar.gz
	pgadmin3.desktop)

build() {
    cd $srcdir/pgadmin3-${_realver}
    unset LDFLAGS
    if [ ! $NOEXTRACT -eq 1 ]; then
      ./configure --prefix=/usr
    fi
    make
}

package() {
    cd $srcdir/pgadmin3-${_realver}
    make DESTDIR=$pkgdir/ install

    install -D -m 644 i18n/pgadmin3.lng $pkgdir/usr/share/pgadmin3/i18n
    install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    mkdir -p $pkgdir/usr/share/pgadmin3/pixmaps/
    mkdir -p $pkgdir/usr/share/applications/

    install -D -m 644 pgadmin/include/images/pgAdmin3.ico $pkgdir/usr/share/pgadmin3/pixmaps/pgAdmin3.ico
    install -D -m 644 $srcdir/pgadmin3.desktop $pkgdir/usr/share/applications/
}
md5sums=('057c9caace7d1deb8688fa39d220f820'
         'd07ba4df54baead30b66d19d7450bcad')
