# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
# Contributor: éclairevoyant

_pkgname=qt6ct
pkgname="$_pkgname-xdg-colorscheme-git"
epoch=1
pkgver=0.9.r5.b92366a
pkgrel=1
pkgdesc='Qt6 Configuration Tool (with XDG desktop portal color scheme support)'
arch=('x86_64')
url="https://github.com/MikeWalrus/$_pkgname"
license=('BSD')
depends=('gtk2' 'qt6-base' 'qt6-svg' 'xdg-desktop-portal')
makedepends=('git' 'qt6-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url#branch=colorscheme-portal")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    /usr/lib/qt6/bin/qmake PREFIX=/usr
    make
}

package() {
    cd $_pkgname
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
