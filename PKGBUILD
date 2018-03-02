# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>
# Maintainer: Evert Vorster <evorster-at-gmail-dot-com>

pkgname=amarok-kf5-git
pkgver=v2.8.90.206.g0d7ae231ee
pkgrel=1
pkgdesc="The powerful music player for KDE - KF5 GIT version"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('kdelibs4support' 'threadweaver' 'plasma-framework'
         'kcmutils' 'knewstuff' 'ktexteditor' 'knotifyconfig' 'kdnssd'
         'libmariadbclient' 'taglib-extras' 'loudmouth' 'clamz' 'gst-plugins-bad'
         'ifuse' 'libgpod' 'libmtp'
         'qca-qt5' 'liblastfm' 'qjson' 'libmygpo-qt5-git' 'qt5-webkit')
makedepends=('pkgconfig' 'extra-cmake-modules' 'kdoctools')
optdepends=()
conflicts=('amarok')
provides=('amarok')
#install="${pkgname}.install"
#source=(${pkgname}::git://anongit.kde.org/amarok.git)
source=(git://anongit.kde.org/amarok.git#branch=kf5)
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
