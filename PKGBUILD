# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=snap-git
_pkgname=Snap
#pkgver=2.4
pkgver=r1433.2d92ca1
pkgrel=1
pkgdesc='Stanford Network Analysis Platform (SNAP) is a general purpose, high performance system for analysis and manipulation of large networks.'
arch=( 'i686' 'x86_64' 'armv6' 'armv6h' 'arm7h' )
url='http://tulip.labri.fr/'
license=('GPL')
depends=(
    'gnuplot'
    'graphviz'
    )
makedepends=(
    'make'
    )
source=(
    #"http://snap.stanford.edu/releases/${_pkgname}-${pkgver}.zip"
    #"${pkgname}::git+https://github.com/snap-stanford/snap.git"
    "${pkgname}::git+https://github.com/yhfudev/snap.git"
    )
#sha1sums=('8eefd6f8ce3c2fe9bea9a8c47920f1cba7fc667b')
#md5sums=('5ab35fa4ad262399d5234ec7a04d457d')
md5sums=(SKIP)

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    #local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    #echo ${ver:0:7}
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver() {
    pkgver_git
}

prepare()
{
    cd "${srcdir}/${pkgname}"
    #cd "${srcdir}/${pkgname}-${pkgver}"
}

build()
{
    cd "${srcdir}/${pkgname}"
    #cd "${srcdir}/${_pkgname}-${pkgver}"

    ./autogen.sh
    ./configure --prefix=/usr --includedir=/usr/include/libsnap/blank/
    #make -j $(cat /proc/cpuinfo | grep processor | wc -l | awk '{print $0 + 1;}') $MAKEFLAGS
    make $MAKEFLAGS
}

verify_build()
{
    cd "${srcdir}/${pkgname}"
    #cd "${srcdir}/${_pkgname}-${pkgver}"
}

package()
{
    cd "${srcdir}/${pkgname}"
    #cd "${srcdir}/${_pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
