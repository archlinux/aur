# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-xref
pkgver=2020
pkgrel=1
_repo_name=gnatcoll-db
_upstream_ver=20.2

pkgdesc='GNAT Components Collection - Tool to support parsing *.ali and *.gli files.'
url='https://github.com/AdaCore/gnatcoll-db/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gnatcoll-core' 'gnatcoll-iconv' 'gnatcoll-sqlite')
makedepends=('gprbuild')

source=("${_repo_name}-${_upstream_ver}.tar.gz::https://github.com/AdaCore/${_repo_name}/archive/${_upstream_ver}.tar.gz")
sha1sums=('cd8e0f62f1fa9bc38f36a9493d20fe46159ce575')

build()
{
    cd "$srcdir/$_repo_name-$_upstream_ver/xref"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
}

package()
{
    cd "$srcdir/$_repo_name-$_upstream_ver/xref"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1
}
