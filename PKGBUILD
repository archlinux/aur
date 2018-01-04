# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Maintainer: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>

pkgname=amarok-kf5-git
pkgver=v2.8.90.176.gc9b5bbb727
pkgrel=1
pkgdesc="The powerful music player for KDE - KF5 GIT version"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('taglib' 'threadweaver' 'libmariadbclient' 'kdelibs4support' 
	'libofa' 'knewstuff' 'ffmpeg' 'kcmutils' 'ktexteditor'
        'extra-cmake-modules' 'knotifyconfig' 'kdnssd' 'plasma-framework'
        'kdesignerplugin' 'kdoctools')
makedepends=()
optdepends=()
conflicts=('amarok')
provides=('amarok')
install="${pkgname}.install"
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
#patch -Np1 <../amarok-git.patch
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
