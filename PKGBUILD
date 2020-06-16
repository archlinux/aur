# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=breeze-gtk-git
pkgver=5.19.80.r386.84530ae
pkgrel=1
pkgdesc="Breeze widget theme for GTK 2 and 3. (GIT version)"
arch=('x86_64')
url='https://quickgit.kde.org/?p=breeze-gtk.git'
license=('LGPL')
depends=('qt5-base')
makedepends=('git'
             'extra-cmake-modules'
             'sassc'
             'breeze'
             'python-cairo'
             )
conflicts=('breeze-gtk')
provides=('breeze-gtk')
source=('git+https://invent.kde.org/plasma/breeze-gtk.git')
sha256sums=('SKIP')

pkgver(){
  cd breeze-gtk
  _ver="$(cat CMakeLists.txt | grep -m1 -e PROJECT_VERSION | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare(){
  mkdir -p build
}

build(){
  cd build
  cmake ../breeze-gtk \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
