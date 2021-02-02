# Merged with official ABS kdepim-addons PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=kdepim-addons-git
pkgver=5.16.40_r3981.g139fef08
pkgrel=1
pkgdesc='Addons for KDE PIM applications'
arch=($CARCH)
url='https://kontact.kde.org'
license=(GPL LGPL FDL)
depends=(incidenceeditor-git ktnef-git libksieve-git akonadi-import-wizard-git popplerkitinerary-git kontactinterface-git discount)
makedepends=(git extra-cmake-modules-git kdoctools-git boost)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('grammalecte: French grammar plugin')
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
