# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>
# Contributor: smlb <smlb at riseup dot net>

pkgname=libthinkpad-git
pkgver=2.6.r4.gd8a8681
pkgrel=1
pkgdesc="A general purpose userspace ThinkPad library"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/libthinkpad"
license=('BSD')
depends=('libsystemd')
makedepends=('cmake' 'git' 'pkg-config' 'systemd')
conflicts=('libthinkpad')
provides=('libthinkpad')
options=('!strip')
_gitname=libthinkpad
source=("git+https://github.com/libthinkpad/libthinkpad" "$_gitname.install")
md5sums=('SKIP'
         'b44e3c7ddac879d57b45a709544df785')
install=$_gitname.install


pkgver() {
    cd "$srcdir/$_gitname"
    git -C "${_pkgname}" describe --long | sed "s/-/.r/;s/-/./g"
}

build () {
    cd "$srcdir/$_gitname"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DLIB=lib
    make 
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR=$pkgdir install
}
