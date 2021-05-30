# Merged with official ABS okular PKGBUILD by João, 2021/04/30 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Alex Talker

pkgname=okular-git
pkgver=21.07.70_r9334.g195bbe363
pkgrel=1
pkgdesc='Document Viewer'
arch=($CARCH)
url="https://kde.org/applications/graphics/okular/"
license=(GPL LGPL FDL)
groups=(kde-applications-git kde-graphics-git)
depends=(djvulibre libspectre libkexiv2-git poppler-qt5 kpty-git kactivities-git threadweaver-git kjs-git kparts-git purpose-git discount phonon-qt5-git)
makedepends=(git extra-cmake-modules-git ebook-tools kdegraphics-mobipocket-git kdoctools-git khtml-git chmlib)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket-git: mobi support' 'libzip: CHM support'
            'khtml-git: CHM support' 'chmlib: CHM support' 'calligra: ODT and ODP support'
            'unrar: Comic Book Archive support' 'unarchiver: Comic Book Archive support (alternative)')
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
