# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Daniel Landau <daniel@landau.fi>
# Contributor: Maxqia <contrib@maxqia.com>

# The following people have contributed to keepassx-git package
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Jamie Macdonald <jamie.alban@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Paolo Stivanin <admin at polslinux dot it>

pkgname=keepassxc
pkgver=2.0.3
pkgrel=1
pkgdesc="A reboot with keepasshttp of an OpenSource password safe which helps you to manage your passwords in an easy and secure way"
arch=('i686' 'x86_64')
url="https://github.com/keepassxreboot/keepassx"
license=('GPL2')
depends=('libxtst' 'shared-mime-info' 'qt5-x11extras' 'hicolor-icon-theme' 'desktop-file-utils' 'libmicrohttpd')
makedepends=('intltool' 'cmake' 'qt5-base' 'qt5-tools' 'zlib' 'libgcrypt')
conflicts=('keepassx-svn' 'keepassx' 'keepassx-git' 'keepassx2-git' 'keepassx2' 'keepassx2-yubikey-git' 'keepassx-http' 'keepassx-reboot-git')
provides=("keepassx{,2}" 'keepassx-http' 'keepassx-reboot')
replaces=('keepassx-http' 'keepassx-reboot')
source=("https://github.com/keepassxreboot/keepassxc/archive/${pkgver}-http.tar.gz")
sha256sums=('b88291118a5b253d9517a9812b418329ce1273fa15788e60e58d59dfce489370')

prepare() {
    cd "${srcdir}/keepassx-${pkgver}-http"
    sed -i '/git/d' src/CMakeLists.txt
    mkdir -p build
}

build() {
    cd "${srcdir}/keepassx-${pkgver}-http/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DWITH_GUI_TESTS=OFF \
        -DCMAKE_BUILD_TYPE=Release ..
    make
}

check() {
    cd "${srcdir}/keepassx-${pkgver}-http/build"
    make test
}

package() {
    cd "${srcdir}/keepassx-${pkgver}-http/build"
    make DESTDIR="${pkgdir}" install
}

