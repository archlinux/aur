# Maintainer: zan <zan@420blaze.it>

pkgname=kontrast-git
_name=${pkgname%-git}
pkgver=v1.0.1.r47.g8c2b1e0
pkgrel=1
arch=(x86_64)
url='https://invent.kde.org/accessibility/kontrast'
pkgdesc="Tool to check contrast for colors that allows verifying that your colors are correctly accessible"
license=(GPL)
groups=(kde-applications kde-accessibility)
depends=(kcoreaddons ki18n kirigami2 hicolor-icon-theme)
makedepends=(extra-cmake-modules git)
conflicts=(kontrast)
provides=(kontrast)
source=("git+https://invent.kde.org/accessibility/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
