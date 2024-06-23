# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>
# Contributor: smlb <smlb at riseup dot net>

pkgname=dockd-git
pkgver=1.21.r13.g0f96047
pkgrel=1
pkgdesc="Lenovo ThinkPad Dock Management Daemon"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/dockd"
license=('BSD')
depends=('libthinkpad-git' 'libxrandr')
makedepends=('cmake' 'git' 'pkg-config')
options=('!strip')
conflicts=("dockd")
provides=("dockd")
source=("git+https://github.com/libthinkpad/dockd")
md5sums=('SKIP')

_gitname=dockd

pkgver() {
    cd "$srcdir/$_gitname"
    git -C "${_pkgname}" describe --long | sed "s/-/.r/;s/-/./g"
}

build () {
    cd "$srcdir/$_gitname"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make 
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR=$pkgdir install
}
