# Maintainer: Ingo Bürk <admin at airblader dot de>
_pkgname=util-xrm
pkgname=xcb-${_pkgname}-git
pkgver=v1.2.r0.ga45b3d0
pkgrel=1
pkgdesc='XCB utility functions for the X resource manager'
arch=('i686' 'x86_64')
url="https://github.com/Airblader/xcb-util-xrm"
license=('MIT')
depends=('xcb-util')
makedepends=('git' 'xorg-util-macros' 'libx11')
provides=("xcb-${_pkgname}")
conflicts=("xcb-${_pkgname}")
source=("$_pkgname::git+http://github.com/Airblader/xcb-util-xrm")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    git submodule update --init
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp "$srcdir/$_pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
}
