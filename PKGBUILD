# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-sql
epoch=1
pkgver=21.0.0
pkgrel=2
_repo_name=gnatcoll-db

pkgdesc='GNAT Components Collection - SQL database support'
url='https://github.com/AdaCore/gnatcoll-db/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gnatcoll-core')
makedepends=('gprbuild')

source=("$_repo_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('380abb79f49510b2bea461fbe3af1966cf82c3ad738791bcb870dc575583a136')

build()
{
    cd "$srcdir/$_repo_name-$pkgver/sql"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
}

package()
{
    cd "$srcdir/$_repo_name-$pkgver/sql"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1
}
