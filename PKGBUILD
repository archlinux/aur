# Merged with official ABS grantlee-editor PKGBUILD by João, 2021/07/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=grantlee-editor-git
pkgver=24.04.40_r1072.ge41c20c
pkgrel=1
pkgdesc='Editor for Grantlee themes'
arch=($CARCH)
url='https://kontact.kde.org/'
license=(GPL-2.0-or-later)
depends=(akonadi-contacts-git gcc-libs glibc grantleetheme-git karchive-git kcompletion-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kcrash-git kdbusaddons-git ki18n-git kio-git kmime-git ktextaddons-git kwidgetsaddons-git kxmlgui-git messagelib-git pimcommon-git qt6-base qt6-webengine syntax-highlighting-git)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(RELEASE_SERVICE_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  _ver=${_ver:-"$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"}
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
