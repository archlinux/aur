# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-db2ada
pkgver=2020
pkgrel=1
_repo_name=gnatcoll-db
_upstream_ver=20.2

pkgdesc='GNAT Components Collection - Tool to generate Ada code from database schemas'
url='https://github.com/AdaCore/gnatcoll-db/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gnatcoll-core' 'gnatcoll-sql' 'python')
makedepends=('gprbuild')

source=("${_repo_name}-${_upstream_ver}.tar.gz::https://github.com/AdaCore/${_repo_name}/archive/${_upstream_ver}.tar.gz")
sha1sums=('cd8e0f62f1fa9bc38f36a9493d20fe46159ce575')

build()
{
    cd "$srcdir/$_repo_name-$_upstream_ver/gnatcoll_db2ada"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
}

package()
{
    cd "$srcdir/$_repo_name-$_upstream_ver/gnatcoll_db2ada"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1
}
