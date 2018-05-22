# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>
# Maintainer: Evert Vorster <evorster-at-gmail-dot-com>

pkgname=amarok-git
pkgver=2.9.0.r225.gd98ec3f7a9
pkgrel=1
pkgdesc="The powerful music player for KDE - GIT version"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('kdelibs4support' 'threadweaver' 'plasma-framework'
         'kcmutils' 'knewstuff' 'ktexteditor' 'knotifyconfig' 'kdnssd'
         'libmariadbclient' 'taglib-extras' 'gst-plugins-bad'
         'qca-qt5' 'liblastfm-qt5' 'qt5-webkit' 'ffmpeg')
makedepends=('pkgconfig' 'extra-cmake-modules' 'kdoctools')
optdepends=("libgpod: support for Apple iPod audio devices"
	    "libmtp: support for portable media devices"
            "loudmouth: backend needed by mp3tunes for syncing"
            "ifuse: support for Apple iPod Touch and iPhone"
            "libmygpo-qt5-git: gpodder.net Internet Service"
            "clamz: allow to download songs from Amazon.com")
conflicts=('amarok' 'amarok2')
provides=('amarok')
#install="${pkgname}.install"
#source=(${pkgname}::git://anongit.kde.org/amarok.git)
source=(git://anongit.kde.org/amarok.git)
sha1sums=('SKIP')

pkgver() {
    cd amarok
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare(){
#cd amarok
#pwd;
#patch -Np1 <../../amarok.kf5-git-savechanges.patch
#}

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
