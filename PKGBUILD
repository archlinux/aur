# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Jamie Macdonald <jamie.alban@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Paolo Stivanin <admin at polslinux dot it>
# Contributor: Sebastian Wolf <fatmike303 at gmail dot com>

pkgname=keepassx-meonwax-git
_gitname=keepassx
pkgver=2.0.2.r68.gec14b98
pkgrel=1
pkgdesc="Cross platform port of the windows application 'Keepass Password Safe' - Git version with patches my @meonwax"
arch=('i686' 'x86_64')
url="https://github.com/meonwax/keepassx"
license=('GPL2')
depends=('libxtst' 'shared-mime-info' 'qt5-x11extras' 'hicolor-icon-theme' 'desktop-file-utils')
install=keepassx-meonwax-git.install
makedepends=('git' 'intltool' 'cmake' 'qt5-base' 'qt5-tools' 'zlib' 'libgcrypt')
conflicts=('keepassx-svn' 'keepassx' 'keepassx2-git' 'keepassx2' 'keepassx2-yubikey-git' 'keepassx-git')
options=(!emptydirs)
source=(git+https://github.com/meonwax/keepassx.git)
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${_gitname}
    mkdir -p build
}

build() {
    cd "${_gitname}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DWITH_GUI_TESTS=ON \
        -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "${_gitname}/build"
    make DESTDIR="${pkgdir}" install
}


