# Maintainer: Daniel Landau <daniel@landau.fi>

# The following people have contributed to keepassx-git package
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Jamie Macdonald <jamie.alban@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Paolo Stivanin <admin at polslinux dot it>

pkgname=keepassx-daniellandau-git
_gitname=keepassx
pkgver=2.0.alpha6.r713.g18b9b3a
pkgrel=1
pkgdesc="A fork with more merged features of an OpenSource password safe which helps you to manage your passwords in an easy and secure way"
arch=('i686' 'x86_64')
url="https://github.com/daniellandau/keepassx"
license=('GPL2')
depends=('libxtst' 'shared-mime-info' 'qt5-x11extras' 'hicolor-icon-theme' 'desktop-file-utils' 'oath-toolkit')
install=keepassx.install
makedepends=('git' 'intltool' 'cmake' 'qt5-base' 'qt5-tools' 'zlib' 'libgcrypt')
conflicts=('keepassx-svn' 'keepassx' 'keepassx-git' 'keepassx2-git' 'keepassx2' 'keepassx2-yubikey-git')
options=(!emptydirs)
source=(git+https://github.com/daniellandau/keepassx.git)
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_gitname}"
    mkdir -p build
}

build() {
    cd "${_gitname}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DWITH_GUI_TESTS=ON \
        -DWITH_XC_AUTOTYPE=ON \
        -DWITH_XC_HTTP=ON \
        -DCMAKE_BUILD_TYPE=Release ..
    make
}

#check() {
#    cd "${_gitname}/build"
#    make test
#}

package() {
    cd "${_gitname}/build"
    make DESTDIR="${pkgdir}" install
}


