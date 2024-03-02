# Merged with official ABS kjots PKGBUILD by João, 2024/03/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kjots-git
pkgver=5.1.1_r1257.g9af0f41
pkgrel=1
pkgdesc='A note taking application for KDE'
url='https://www.kde.org/applications/utilities/kjots/'
arch=($CARCH)
license=(GPL)
depends=(akonadi-git akonadi-notes5 gcc-libs glibc grantlee kbookmarks5 kconfig5 kconfigwidgets5 kcoreaddons5 ki18n5 kio5 kitemmodels5 kmime5 kontactinterface5 kparts5 kpimtextedit5 kwidgetsaddons5 ktextaddons5 kxmlgui5 libakonadi5 qt5-base)
makedepends=(git extra-cmake-modules-git kcmutils5 kdoctools5)
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
