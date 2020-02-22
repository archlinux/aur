# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-sqlite
pkgver=2019
pkgrel=2

pkgdesc='GNAT Components Collection - SQLite database support'
url='https://github.com/AdaCore/gnatcoll-db/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gnatcoll-sql' 'sqlite3')
makedepends=('gprbuild')

source=('https://github.com/AdaCore/gnatcoll-db/archive/master.zip')
sha1sums=('eeefdd157ccd2ad62e807ab64eae07bb3f651300')


build()
{
    cd "$srcdir/gnatcoll-db-master/sqlite"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS=-R
}


package()
{
    cd "$srcdir/gnatcoll-db-master/sqlite"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    #
    make prefix="$pkgdir/usr" install -j1
}
