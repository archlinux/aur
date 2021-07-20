# Merged with official ABS akregator PKGBUILD by João, 2021/07/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=akregator-git
pkgver=21.11.40_r6188.g12c82b62
pkgrel=1
pkgdesc="A Feed Reader by KDE"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL2)
depends=(kontactinterface-git messagelib-git knotifyconfig-git ktexteditor-git syndication-git kuserfeedback-git)
makedepends=(git extra-cmake-modules-git boost kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('kdepim-addons-git: additional plugins')
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
