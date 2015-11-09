# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=breeze-gtk-git
pkgver=5.4.90.r65.b0ef3ac
pkgrel=1
pkgdesc="Breeze port for GTK. (GIT version)"
arch=('i686' 'x86_64')
url='https://quickgit.kde.org/?p=breeze-gtk.git'
license=('LGPL')
depends=('qt5-base')
optdepends=('gtk2: GTK+2 theme'
            'gtk3: GTK+3 theme')
makedepends=('git'
             'extra-cmake-modules'
             'gtk2'
             )
source=('git://anongit.kde.org/breeze-gtk.git')
sha1sums=('SKIP')

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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
