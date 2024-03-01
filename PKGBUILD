# Merged with official ABS kdegraphics-thumbnailers PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kdegraphics-thumbnailers-git
pkgver=24.01.90_r318.g54c064e
pkgrel=1
pkgdesc='Thumbnailers for various graphics file formats'
url='https://apps.kde.org/kdegraphics_thumbnailers/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs ghostscript glibc karchive-git kcoreaddons-git kdegraphics-mobipocket-git kio-git libkdcraw-git libkexiv2-git qt6-base)
makedepends=(git extra-cmake-modules-git)
arch=($CARCH)
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
