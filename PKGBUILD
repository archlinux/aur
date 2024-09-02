# Merged with official ABS calligra PKGBUILD by João, 2021/05/30 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Maintainer: Solomon Choina <shlomochoina@gmail.com

pkgname=calligra-git
pkgdesc="A set of applications for productivity and creative usage"
pkgver=4.0.1.r0.g00c463f
pkgrel=1
arch=($CARCH)
url='https://www.calligra-suite.org/'
license=(GPL-2.0-only)
depends=(cauchy gcc-libs glibc gsl imath kcoreaddons sonnet ktextwidgets
         kdiagram kcmutils knotifyconfig kwidgetsaddons qtkeychain-qt6
         libodfgen poppler-qt6 qt6-base phonon-qt6)
makedepends=(git boost eigen extra-cmake-modules kcalendarcore
             kdoctools libakonadi libetonyek libgit2 libvisio
             libwpg libwps pstoedit vc qt6-declarative okular)
optdepends=('libetonyek: Apple Keynote import filter'
            'libvisio: Microsoft Visio import filter'
            'libwpg: Corel WordPerfect Graphics image importer'
            'libwps: Microsoft Works file word processor format import'
            'poppler: PDF to SVG filter'
            'pstoedit: EPS to SVG filter'
            'qt6-webengine: Braindump web shape')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

}
