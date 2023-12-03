# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=audex-git
_gitname=audex
pkgver=r357.80df6d7
pkgrel=1
pkgdesc='Audex is an audio grabber tool for CD-ROM drives built with KDE Frameworks'
arch=('x86_64')
url='https://invent.kde.org/multimedia/audex'
license=('GPL')
depends=('libkcddb5' 'kcmutils5' 'hicolor-icon-theme' 'qt5-script')
optdepends=('libvorbis' 'flac' 'lame' 'faac' 'python-eyed3')
makedepends=('git' 'cmake' 'extra-cmake-modules')
conflicts=('audex')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
   cd ${_gitname}
  
   mkdir build && cd build

  
   cmake .. \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DCMAKE_BUILD_TYPE=Master

}

package() {
  make -C ${_gitname}/build DESTDIR=${pkgdir} install

}
