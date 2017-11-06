# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=audex-git
gitname=audex
pkgver=r140.25d4ca1
pkgrel=1
pkgdesc='Audex is an audio grabber tool for CD-ROM drives built with KDE Frameworks'
arch=('i686' 'x86_64')
url='https://cgit.kde.org/audex.git/'
license=('GPL')
depends=('qt5-script' 'libkcddb' 'cdparanoia' 'kcmutils')
optdepends=('libvorbis' 'flac' 'lame' 'faac' 'python-eyed3')
makedepends=('git' 'subversion')
conflicts=('audex')
provides=('audex')
source=("git+git://anongit.kde.org/audex.git")
sha256sums=('SKIP')

pkgver() {
  
  cd ${gitname}

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  
  cd ${gitname}
  mkdir build && cd build

  
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_L10N_BRANCH=trunk \
        -DKDE_L10N_AUTO_TRANSLATIONS=OFF \
        -DCMAKE_BUILD_TYPE=Release ..
  make fetch-translations

}

package() {
  
  cd ${gitname}/build

  make DESTDIR=${pkgdir} install
}
