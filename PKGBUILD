# Maintainer katt <magunasu.b97@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux,org>

pkgname=dolphin-git
pkgver=20.07.90.r21.g97a14db70
pkgrel=1
pkgdesc='KDE File Manager (Git)'
arch=(i686 x86_64)
url=https://kde.org/applications/en/system/org.kde.dolphin
license=(LGPL)
depends=(baloo-widgets-git knewstuff kio-extras kcmutils kparts kinit)
makedepends=(extra-cmake-modules kdoctools packagekit-qt5 git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://invent.kde.org/system/dolphin.git)
md5sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${pkgname%-git}" \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
