# $Id$
# Maintainer: Alex Talker <alextalker at openmailbox dot org>

pkgname=kdenetwork-kopete-git
pkgver=4.13.1
pkgrel=1
pkgdesc='Instant Messenger, Git version'
url='http://kde.org/applications/internet/kopete/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdenetwork')
depends=('kdebase-runtime' 'kdepimlibs' 'qca-ossl' 'libotr' 'libidn'
         'qimageblitz' 'libgadu' 'mediastreamer' 'jsoncpp')
makedepends=('cmake' 'automoc4' 'boost' 'kdepim-libkdepim' 'git')
provides=('kdenetwork-kopete=4.13.1')
replaces=('kdenetwork-kopete')
conflicts=('kdenetwork-kopete')
install=${pkgname}.install
source=("kopete::git+http://anongit.kde.org/kopete")
sha1sums=('SKIP')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../kopete \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DWITH_Libmsn=OFF
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
