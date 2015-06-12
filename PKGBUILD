# Maintainer: inkr <i@inkr.ml>

pkgname=keepassx-http
_gitname=keepassx
# _upversion=2.0-alpha1
pkgver=2.0.alpha5.r254.g4008e6a
pkgrel=1
pkgdesc="KeePassX + keepasshttp + autotype"
arch=('i686' 'x86_64')
url="https://github.com/jdachtera/keepassx.git"
license=('GPL2')
depends=('libxtst' 'qt4' 'shared-mime-info')
install=keepassx.install
makedepends=('git' 'intltool' 'cmake' 'libmicrohttpd')
conflicts=('keepassx-svn' 'keepassx' 'keepassx2-git' 'keepassx2' 'keepassx-git' 'keepassx')
source=("git+https://github.com/Ivan0xFF/keepassx.git")
#source=("https://github.com/keithbennett/keepassx/archive/${_upversion}.tar.gz")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
#     cd "${_gitname}-${_upversion}"
    git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_gitname}"
#     cd "${_gitname}-${_upversion}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_VERBOSE_MAKEFILE=ON -DWITH_GUI_TESTS=OFF
    make
}

package() {
    cd "${_gitname}"
#     cd "${_gitname}-${_upversion}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}


