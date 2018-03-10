# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>
# Maintainer: Evert Vorster <evorster-at-gmail-dot-com>

pkgname=amarok-git
pkgver=v2.9.0.147.gf96d0d159d
pkgrel=1
pkgdesc="The powerful music player for KDE - GIT version"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('kdelibs4support' 'threadweaver' 'plasma-framework'
         'kcmutils' 'knewstuff' 'ktexteditor' 'knotifyconfig' 'kdnssd'
         'libmariadbclient' 'taglib-extras' 'gst-plugins-bad'
         'qca-qt5' 'liblastfm' 'qjson' 'qt5-webkit' 'ffmpeg' 'gmock')
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
    git describe --always | sed 's|-|.|g'
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
    cmake "../amarok" -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR:STRING=/usr/lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE4_BUILD_TESTS=OFF \
        -DWITH_NepomukCore=OFF \
        -DWITH_Soprano=OFF

    make
}

package(){
    cd build
    make "DESTDIR=${pkgdir}" install
}
