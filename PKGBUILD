# Maintainer: taotieren <admin@taotieren.com>

pkgname=camv-rnd-svn
pkgver=r962
pkgrel=1
pkgdesc="free/open source, small, flexible viewer for PCB-related CAM file formats"
arch=($CARCH)
url="http://www.repo.hu/projects/camv-rnd"
license=('LGPL-2.0-or-later')
provides=(${pkgname%-svn})
conflicts=(${pkgname%-svn})
depends=(
    glibc
    # AUR
    librnd4
)
makedepends=(
    subversion
)
optdepends=(
)
source=("svn://svn.repo.hu/camv-rnd/trunk")
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
