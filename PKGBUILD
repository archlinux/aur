# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=audex-git
_gitname=audex
pkgver=r142.d9e89a8
pkgrel=1
pkgdesc='Audex is an audio grabber tool for CD-ROM drives built with KDE Frameworks'
arch=('i686' 'x86_64')
url='https://cgit.kde.org/audex.git/'
license=('GPL')
depends=('libkcddb' 'kcmutils' 'hicolor-icon-theme')
optdepends=('libvorbis' 'flac' 'lame' 'faac' 'python-eyed3')
makedepends=('git' 'ruby' 'subversion' 'cmake' 'extra-cmake-modules')
conflicts=('audex')
source=("git+git://anongit.kde.org/audex.git")
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
         -DKDE_L10N_BRANCH=trunk \
         -DKDE_L10N_AUTO_TRANSLATIONS=OFF \
         -DCMAKE_BUILD_TYPE=Release
   make fetch-translations

}

package() {
  make -C ${_gitname}/build DESTDIR=${pkgdir} install

}
