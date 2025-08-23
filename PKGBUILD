# Maintainer: taotieren <admin@taotieren.com>

pkgname=fungw-svn
pkgver=r828
pkgrel=4
pkgdesc="tiny, portable library written in C (C89) that manages dynamic function calls across different programming languages"
arch=($CARCH)
url="http://www.repo.hu/projects/fungw"
license=('LGPL-2.0-or-later')
provides=(${pkgname%-svn})
conflicts=(${pkgname%-svn})
depends=(
    glibc
    #     genht
)
makedepends=(
    subversion
)
optdepends=(
    lua
    perl
    tcl
    python
    duktape
    mujs
    'libmawk>=1.0.3'
)
source=("svn://svn.repo.hu/fungw/trunk")
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
