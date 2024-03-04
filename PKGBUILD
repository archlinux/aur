# Merged with official ABS kile PKGBUILD by João, 2024/03/04 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: TH Campbell (dysphoria) <thcampbell (at) protonmail (dot) com>
# Contributor: fclad <fcladera at fcladera.com>
# Contributor: Antonio Rojas
# Contributor: prettyvanilla <prettyvanilla at posteo.at>
# Contributor: vnoel <victor.noel at crazydwarves dot org>

pkgname=kile-git
pkgver=3.0b2_r3569.g66599ab1
pkgrel=1
pkgdesc='A user friendly TeX/LaTeX frontend for KDE'
arch=($CARCH)
url='https://apps.kde.org/kile/'
license=(GPL-2.0-only)
depends=(gcc-libs glibc kcodecs-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kdbusaddons-git kguiaddons-git ki18n-git kiconthemes-git kinit-git kio-git kjobwidgets-git kparts-git kservice-git ktexteditor-git ktextwidgets-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git okular-git kcolorscheme-git hicolor-icon-theme perl poppler-qt6 qt6-base qt6-script qt6-5compat qt6-declarative texlive-basic)
makedepends=(git extra-cmake-modules-git kdoctools-git okular-git)
optdepends=('konsole-git: embedded terminal' 'imagemagick: for some file type conversions')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')


prepare() {
  cd ${pkgname%-git}
  git checkout work/carl/kf6
}

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
