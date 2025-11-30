# Maintainer: Mateusz Okulanis FPGArtktic@outlook.com
# Contributor: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>
# Contributor: smlb <smlb at riseup dot net>

pkgname=dockd-cmake3dot5-git
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
    git describe --long | sed "s/-/.r/;s/-/./g"
}

build () {
    cd "$srcdir/$_gitname"
    # Fix CMake minimum required version
    sed -i 's/cmake_minimum_required(VERSION 2.8)/cmake_minimum_required(VERSION 3.5)/' CMakeLists.txt
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make 
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR=$pkgdir install
}
