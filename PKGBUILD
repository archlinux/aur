# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=breeze-gtk-git
pkgver=6.2.80.r541.5b65eb2
pkgrel=1
pkgdesc="Breeze widget theme for GTK 2 and 3. (GIT version)"
arch=('any')
url='https://invent.kde.org/plasma/breeze-gtk'
license=('LGPL')
depends=('qt6-base')
makedepends=(
  'git'
  'extra-cmake-modules'
  'sassc'
  'breeze'
  'python-cairo'
  'qt6-tools'
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

build(){
  cmake -S breeze-gtk -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_WITH_QT6=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
