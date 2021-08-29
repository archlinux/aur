# Merged with official ABS kdegraphics-thumbnailers PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kdegraphics-thumbnailers-git
pkgver=21.07.90_r236.g918502e
pkgrel=1
pkgdesc='Thumbnailers for various graphics file formats'
url='https://apps.kde.org/kdegraphics_thumbnailers/'
arch=($CARCH)
license=(GPL LGPL FDL)
depends=(libkexiv2-git libkdcraw-git kio-git ghostscript)
makedepends=(git extra-cmake-modules-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kde-graphics-git)
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
