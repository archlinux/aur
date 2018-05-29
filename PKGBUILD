# Maintainer: Evert Vorster <evorster-at-gmail-dot-com>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>

pkgname=amarok-git
pkgver=2.9.0.r230.ged38fe752f
pkgrel=1
pkgdesc="The powerful music player for KDE - GIT version"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('kdelibs4support' 'threadweaver' 'plasma-framework'
         'kcmutils' 'knewstuff' 'ktexteditor' 'knotifyconfig' 'kdnssd'
         'libmariadbclient' 'taglib-extras' 'gst-plugins-bad'
         'qca-qt5' 'liblastfm-qt5' 'qt5-webkit' 'ffmpeg')
makedepends=('git' 'extra-cmake-modules' 'kdoctools')
optdepends=("libgpod: support for Apple iPod audio devices"
            "libmtp: support for portable media devices"
            "loudmouth: backend needed by mp3tunes for syncing"
            "libmygpo-qt5: gpodder.net Internet Service"
            "qt5-webengine: for the wikipedia applet"
            "gmock: tests")
conflicts=('amarok')
provides=('amarok')
source=(git://anongit.kde.org/amarok.git)
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
