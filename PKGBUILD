# Maintainer: Maxqia maxqia@kliznoe.com

pkgname=keepassx-http
_gitname=keepassx
pkgver=2.0.alpha6.r214.g8b6d49a
pkgrel=1
pkgdesc="KeepassX, with eugenesan's merge request for keepasshttp."
arch=('i686' 'x86_64')
url="https://github.com/eugenesan/keepassx/tree/http"
license=('GPL2')
depends=('libxtst' 'shared-mime-info' 'qt5-x11extras' 'hicolor-icon-theme' 'desktop-file-utils' 'qjson' 'libmicrohttpd')
install=keepassx.install
makedepends=('git' 'intltool' 'cmake' 'qt5-base' 'qt5-tools' 'zlib' 'libgcrypt')
conflicts=('keepassx-svn' 'keepassx' 'keepassx2-git' 'keepassx2' 'keepassx2-yubikey-git' 'keepassx-http' 'keepassx-git')
options=(!emptydirs)
source=(git+https://github.com/eugenesan/keepassx.git#branch=2.0-http-totp-beta2)
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_gitname}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_VERBOSE_MAKEFILE=OFF -DWITH_GUI_TESTS=ON
    make
}

package() {
    cd "${_gitname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}


