# Merged with official ABS cantor PKGBUILD by João, 2026/05/04 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Electro707 <develop@electro707.com>

pkgname=cantor-git
pkgver=26.07.70_r4261.g75049f19
pkgrel=1
pkgdesc='KDE Frontend to Mathematical Software'
url='https://apps.kde.org/cantor/'
arch=($CARCH)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs glibc karchive-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git ki18n-git kiconthemes-git kio-git knewstuff-git kparts-git ktexteditor-git ktextwidgets-git kwidgetsaddons-git kxmlgui-git libqalculate libspectre libxml2 libxslt poppler-qt6 qt6-base qt6-svg qt6-tools qt6-webengine syntax-highlighting-git)
makedepends=(git analitza-git extra-cmake-modules-git julia kdoctools-git luajit python r)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('analitza-git: KAlgebra backend'
            'maxima: Maxima backend'
            'octave: Octave backend'
            'r: R backend'
            'luajit: LUA backend'
            'python: Python backend'
            'sagemath: SageMath backend'
            'julia: Julia backend')
groups=(kde-applications-git kde-education-git)
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
