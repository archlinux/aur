# Maintainer: notfoss <AT> gmx.com

pkgname="lnav-git"
pkgver="0.7.2.r138.g9018238"
pkgrel="2"
pkgdesc="A featureful ncurses based log file viewer"
arch=("i686" "x86_64")
url="http://lnav.org/"
license=("BSD")
depends=("bzip2" "ncurses" "pcre" "readline" "sqlite" "zlib")
makedepends=("git")
conflicts=("lnav")
provides=("lnav")
source=("$pkgname"::"git+https://github.com/tstack/lnav.git")
md5sums=("SKIP")

pkgver() {
    cd "$pkgname"
    # tag + number of commits since that + SHA-1 (first 7 characters) of the last commit
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    ./configure --prefix=/usr --disable-static
    make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
    cd "$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    # BSD license
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/lnav/LICENSE"
}
