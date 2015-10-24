# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=breeze-gtk-git
pkgver=r58.32d6ad5
pkgrel=1
pkgdesc="Breeze port for GTK. (GIT version)"
arch=('any')
url="https://quickgit.kde.org/?p=breeze-gtk.git"
license=('LGPL')
optdepends=("gtk2: GTK+2 theme"
            "gtk3: GTK+3 theme")
makedepends=('git'
             'extra-cmake-modules')
source=('git://anongit.kde.org/breeze-gtk.git')
sha1sums=('SKIP')

pkgver(){
  cd breeze-gtk
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  mkdir -p build
}

build(){
  cd build
  cmake ../breeze-gtk \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
