# Maintainer: mrdotx <klassiker@gmx.de>
# Contributor: shulhan <ms@kilabit.info>
# Contributor: Bill Kolokithas <kolokithas.b@gmail.com>
_pkgname=j4-dmenu-desktop
pkgname=j4-dmenu-desktop-git
pkgver=2.18.r11.g7a64862
pkgrel=4
pkgdesc='A rewrite of i3-dmenu-desktop, which is much faster'
arch=('i686' 'x86_64')
url='https://github.com/enkore/j4-dmenu-desktop'
license=('GPL3')
makedepends=(
    'git'
    'cmake')
optdepends=(
    'dmenu: the default backend'
    'bemenu: an alternative backend'
)
provides=('j4-dmenu-desktop')
conflicts=('j4-dmenu-desktop')
source=('git+https://github.com/enkore/j4-dmenu-desktop.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed -r 's/^r//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DNO_TESTS=1 .
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir"/ install
}
