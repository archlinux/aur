# Merged with official ABS kontact PKGBUILD by João, 2021/07/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kontact-git
pkgver=24.04.40_r5943.g53475bce
pkgrel=2
pkgdesc="KDE Personal Information Manager"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc grantleetheme-git kcmutils-git kcolorscheme-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git ki18n-git kio-git kjobwidgets-git kontactinterface-git kmail-account-wizard-git kparts-git kservice-git kwidgetsaddons-git kxmlgui-git libkdepim-git pimcommon-git qt6-base qt6-webengine)
makedepends=(git extra-cmake-modules-git kdoctools-git)
optdepends=(akregator-git
            kaddressbook-git
            kjots-git
            kmail-git
            knotes-git
            korganizer-git
            zanshin-git)
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
