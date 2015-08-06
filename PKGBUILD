# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=qps
pkgname=$_pkgname-git
pkgver=r14.3ad194f
pkgrel=2
pkgdesc="Qt process manager"
arch=("i686" "x86_64")
url="https://github.com/QtDesktop/qps"
license=("unknown")
depends=("qt5-x11extras" "libxkbcommon-x11" "hicolor-icon-theme")
makedepends=("git" "cmake")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/QtDesktop/qps.git"
        "qps.desktop")
sha256sums=("SKIP"
            "52396289949c2e57fb88773068c90aeb9bc6628e1f72f851d19a9dfbf3f85581")

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir build ; cd build
    cmake ../$_pkgname -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR=$pkgdir install
    install -D -m644 $startdir/qps.desktop $pkgdir/usr/share/applications/qps.desktop
    install -D -m644 $srcdir/$_pkgname/icon/icon.xpm $pkgdir/usr/share/icons/hicolor/48x48/apps/qps.xpm
}
