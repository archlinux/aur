# Merged with official ABS rsibreak PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Dmytro Kostiuchenko <edio@archlinux.us>
# Contributor: Dmytro Kostiuchenko <edio@archlinux.us>

pkgname=rsibreak-git
pkgver=0.12.15_r1159.g915755d
pkgrel=2
pkgdesc='Takes care of your health and regularly breaks your work to avoid repetitive strain injury (RSI)'
url='https://apps.kde.org/rsibreak/'
license=(GPL)
depends=(gcc-libs glibc kconfig5 kconfigwidgets5 kcoreaddons5 kcrash5 kdbusaddons5 ki18n5 kidletime5 knotifications5 knotifyconfig5 ktextwidgets5 kwidgetsaddons5 kwindowsystem5 kxmlgui5 qt5-base)
makedepends=(git extra-cmake-modules-git kdoctools5)
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
