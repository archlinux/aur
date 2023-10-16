# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plymouth-kcm-git
pkgver=5.26.90.r117.g622e920
pkgrel=1
pkgdesc='KCM to manage the Plymouth (Boot) theme'
arch=(x86_64)
url='https://invent.kde.org/plasma/plymouth-kcm'
license=(LGPL)
conflicts=(plymouth-kcm)
provides=(plymouth-kcm)
depends=(systemsettings plymouth)
makedepends=('cmake-git' 'extra-cmake-modules-git' 'kauth-git' 'karchive-git' 'knewstuff-git' 'kio-git' 'ki18n-git' 'kconfig-git' 'kcmutils-git')
groups=(kf6-git)
source=(${pkgname%-git}::git+${url}.git)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
