# Maintainer: Maxqia maxqia@kliznoe.com

pkgname=keepassx-http-merge
_gitname=keepassx
pkgver=2.0.alpha6.r235.gf076ad3
pkgrel=1
pkgdesc="KeepassX, with eugenesan's merge request for keepasshttp."
arch=('i686' 'x86_64')
url="https://github.com/eugenesan/keepassx/tree/http"
license=('GPL2')
depends=('libxtst' 'qt4' 'shared-mime-info' 'qjson' 'libmicrohttpd')
install=keepassx.install
makedepends=('git' 'intltool' 'cmake' 'zlib' 'libgcrypt')
optdepends=('libxtst : auto-type support')
conflicts=('keepassx-svn' 'keepassx' 'keepassx2-git' 'keepassx2' 'keepassx2-yubikey-git' 'keepassx-http' 'keepassx-git')
source=(git+https://github.com/eugenesan/keepassx.git#branch=http)
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_gitname}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_VERBOSE_MAKEFILE=ON -DWITH_GUI_TESTS=ON
    make
}

package() {
    cd "${_gitname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}


