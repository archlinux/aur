# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ttf-oxygen-git
pkgver=5.3.90.r168.4a2d1f7
pkgrel=1
pkgdesc="A desktop/gui font family for integrated use with the KDE desktop. (GIT version)"
arch=("any")
license=("custom:OFL")
url="https://projects.kde.org/projects/playground/artwork/oxygen-fonts"
makedepends=('git' 'cmake' 'extra-cmake-modules' 'fontforge')
provides=("ttf-oxygen")
conflicts=("ttf-oxygen")
source=("git://anongit.kde.org/oxygen-fonts.git")
sha1sums=("SKIP")
install="ttf-oxygen.install"

pkgver() {
  cd oxygen-fonts
  _ver="$(cat CMakeLists.txt | grep PROJECT_VERSION | head -n1 | cut -d '"' -f2)"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../oxygen-fonts \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
