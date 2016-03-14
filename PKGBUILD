# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=krdc-git
pkgver=15.12.2.r28.g0891645
pkgrel=1
pkgdesc='Remote Desktop Client (frameworks branch)'
url='http://kde.org/applications/internet/krdc/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('telepathy-qt5' 'kcmutils' 'kdnssd' 'knotifyconfig' 'libvncserver')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'kdelibs4support')
optdepends=('freerdp: RDP support'
            'kdebase-keditbookmarks: to edit bookmarks')
provides=(kdenetwork-krdc)
conflicts=(kdenetwork-krdc)
source=('git://anongit.kde.org/krdc.git')
md5sums=('SKIP')

pkgver() {
  cd krdc
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake ../krdc \
    -DHAVE_XFREERDP=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
