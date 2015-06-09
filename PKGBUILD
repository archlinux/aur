# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=lazylpsolverlibs-git
pkgver=7d32dc6
pkgrel=1
pkgdesc="lazylpsolverlibs provides libraries that can replace at link time those of commercial lp solvers."
arch=(i686 x86_64 arm)
url="https://github.com/chmduquesne/lazylpsolverlibs.git"
license=(GPL)
depends=(glib2)
makedepends=(gcc)
source=("${pkgname}::git+https://github.com/chmduquesne/lazylpsolverlibs.git")
sha1sums=(SKIP)
conflicts=(lazylpsolverlibs)

pkgver() {
    cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}'  )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

build() {
    cd "${srcdir}/${pkgname}"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --disable-static
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir" install
}
