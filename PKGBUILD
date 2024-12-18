# Maintainer: taotieren <admin@taotieren.com>

pkgname=genht-svn
pkgver=r135
pkgrel=1
pkgdesc="genht is a simple generic hash table implementation in C."
arch=($CARCH)
url="http://www.repo.hu/projects/genht"
license=('0BSD')
provides=(${pkgname%-svn})
conflicts=(${pkgname%-svn})
depends=(
    glibc)
makedepends=(
    subversion)
source=("svn://repo.hu/genht/trunk")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/trunk/"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]/}"
}

build() {
    cd "$srcdir/trunk/"
    make GENHT_LDFLAGS="-Wl,-z,now -Wl,-z,relro"
}

package() {
    cd "$srcdir/trunk/"
    make DESTDIR="$pkgdir/" install
}
