# Merged with official ABS akonadi-contacts PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=akonadi-contacts-git
pkgver=6.0.40_r3696.ge6cd7f4e
pkgrel=1
pkgdesc="Libraries and daemons to implement Contact Management in Akonadi"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc grantleetheme-git ki18n-git kcodecs-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kiconthemes-git kio-git kmime-git ktextaddons-git ktexttemplate-git ktextwidgets-git kwidgetsaddons-git kxmlgui-git libakonadi-git prison-git qt6-base)
makedepends=(git doxygen extra-cmake-modules-git qt6-doc qt6-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kdepim-git)
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
