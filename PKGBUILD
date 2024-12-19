# Maintainer: taotieren <admin@taotieren.com>

pkgname=librnd4-svn
pkgver=r37782
pkgrel=6
pkgdesc="free/open source, flexible, modular two-dimensional CAD engine"
arch=($CARCH)
url="http://www.repo.hu/projects/librnd"
license=('LGPL-2.0-or-later')
provides=('librnd4=4.1.1' 'librnd3' 'librnd')
conflicts=('librnd4=4.1.1' 'librnd3' 'librnd')
depends=(
    glibc
    sh
    #     fungw
)
makedepends=(
    subversion
)
optdepends=(
)
source=("svn://svn.repo.hu/librnd/trunk")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/trunk/"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]/}"
}

build() {
    cd "$srcdir/trunk/"
    ./configure --prefix=/usr
    make LDFLAGS="-Wl,-z,now -Wl,-z,relro"
}

package() {
    cd "$srcdir/trunk/"
    make DESTDIR="$pkgdir/" install
}
