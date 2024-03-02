# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=ktextaddons-git
pkgver=1.5.45_r1256.g3936a38
pkgrel=2
pkgdesc="KDE text addons"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL)
depends=(gcc-libs glibc)
makedepends=(git doxygen extra-cmake-modules-git karchive-git kconfig-git kconfigwidgets-git ki18n-git kio-git ktextaddons-git kwidgetsaddons-git kxmlgui-git qt6-base qt6-doc qt6-speech qt6-tools qtkeychain-qt6 sonnet-git syntax-highlighting-git karchive5 kconfig5 kconfigwidgets5 ki18n5 kio5 kwidgetsaddons5 qt5-base qt5-doc qt5-speech qt5-tools qtkeychain-qt5 sonnet5 syntax-highlighting5)
groups=(kdepim-git)
optdepends=('languagetool: Grammar checking'
            'grammalecte: French grammar checking'
            'libreoffice: Use autocorrection data from LibreOffice')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KTEXTADDONS_CURRENT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
