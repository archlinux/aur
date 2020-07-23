# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=spectacle-git
pkgver=20.07.80.r7.g7931ff8
pkgrel=1
pkgdesc='KDE screenshot capture utility'
arch=(i686 x86_64)
url=https://kde.org/applications/utilities/org.kde.spectacle
license=(GPL)
depends=(xcb-util-cursor libkipi purpose knewstuff kwayland qt5-tools)
makedepends=(extra-cmake-modules kdoctools git)
optdepends=('kipi-plugins: export to various online services')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
groups=(kde-applications kde-graphics)
source=(git+https://invent.kde.org/graphics/spectacle.git)
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" \
   -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
