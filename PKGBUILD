# Maintainer: Evert Vorster <evorster-at-gmail-dot-com>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>

pkgname=amarok-git
pkgver=2.9.0.r481.g252b9ffcfe
pkgrel=1
pkgdesc="The powerful music player for KDE - GIT version"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('threadweaver' 'qt5-webengine' 'phonon-qt5' 'qt5-script'
         'kcmutils' 'knewstuff' 'ktexteditor' 'kdnssd' 'knotifyconfig'
         'libmariadbclient' 'taglib-extras'
         'qca-qt5' 'liblastfm-qt5' 'ffmpeg')
makedepends=('git' 'extra-cmake-modules' 'kdoctools')
optdepends=("libgpod: support for Apple iPod audio devices"
            "libmtp: support for portable media devices"
            "loudmouth: backend needed by mp3tunes for syncing"
            "libmygpo-qt5: gpodder.net Internet Service"
            "gmock: tests")
conflicts=('amarok')
provides=('amarok')
source=(git+https://invent.kde.org/multimedia/amarok.git)
sha512sums=('SKIP')

pkgver() {
    cd amarok
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    rm -rf build
    mkdir -p build
    cd build
    cmake ../amarok \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release

    make
}

package(){
    cd build
    make "DESTDIR=${pkgdir}" install
}
