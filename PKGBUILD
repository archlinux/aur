# Merged with official ABS rsibreak PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Dmytro Kostiuchenko <edio@archlinux.us>
# Contributor: Dmytro Kostiuchenko <edio@archlinux.us>

pkgname=rsibreak-git
pkgver=0.12.15_r1159.g915755d
pkgrel=1
pkgdesc='Takes care of your health and regularly breaks your work to avoid repetitive strain injury (RSI)'
url='https://apps.kde.org/rsibreak/'
license=(GPL)
depends=(gcc-libs glibc kconfig5-git kconfigwidgets5-git kcoreaddons5-git kcrash5-git kdbusaddons5-git ki18n5-git kidletime5-git knotifications5-git knotifyconfig5-git ktextwidgets5-git kwidgetsaddons5-git kwindowsystem5-git kxmlgui5-git qt5-base)
makedepends=(git extra-cmake-modules-git kdoctools5-git)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
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
