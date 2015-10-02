# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Jamie Macdonald <jamie.alban@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Paolo Stivanin <admin at polslinux dot it>

pkgname=keepassx-git
_gitname=keepassx
pkgver=2.0.beta2.r61.g5a59287
pkgrel=1
pkgdesc="It is an OpenSource password safe which helps you to manage your passwords in an easy and secure way"
arch=('i686' 'x86_64')
url="https://github.com/keepassx/keepassx"
license=('GPL2')
depends=('libxtst' 'shared-mime-info' 'qt5-x11extras' 'hicolor-icon-theme' 'desktop-file-utils')
install=keepassx.install
makedepends=('git' 'intltool' 'cmake' 'qt5-base' 'qt5-tools' 'zlib' 'libgcrypt')
conflicts=('keepassx-svn' 'keepassx' 'keepassx2-git' 'keepassx2' 'keepassx2-yubikey-git')
options=(!emptydirs)
source=(git+https://github.com/keepassx/keepassx.git)
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


