# Merged with official ABS rsibreak PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Dmytro Kostiuchenko <edio@archlinux.us>
# Contributor: Dmytro Kostiuchenko <edio@archlinux.us>

pkgname=rsibreak-git
pkgver=0.12.14_r936.g8b4b9e4
pkgrel=1
pkgdesc='Takes care of your health and regularly breaks your work to avoid repetitive strain injury (RSI)'
url='https://apps.kde.org/rsibreak/'
arch=($CARCH)
license=(GPL)
depends=(knotifyconfig-git kidletime-git hicolor-icon-theme)
makedepends=(git extra-cmake-modules-git kdoctools-git)
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
