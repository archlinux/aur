# Merged with official ABS akonadi-import-wizard PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=akonadi-import-wizard-git
pkgver=5.16.40_r1675.g7d8df2c
pkgrel=1
pkgdesc="Import data from other mail clients to KMail"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL2)
depends=(mailcommon-git)
makedepends=(git extra-cmake-modules-git boost kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('kdepim-addons-git: additional import plugins')
groups=(kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
