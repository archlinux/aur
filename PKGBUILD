# Maintainer katt <magunasu.b97@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux,org>

pkgname=dolphin-git
pkgver=21.07.90.r29.g0ed31f10c
pkgrel=1
pkgdesc='KDE File Manager (git)'
arch=(i686 x86_64)
url=https://kde.org/applications/system/dolphin
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kactivities kuserfeedback)
makedepends=(extra-cmake-modules kdoctools git)
optdepends=('kde-cli-tools: for editing file type options'
            'ffmpegthumbs: video thumbnails'
            'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel'
            'purpose: share context menu')
groups=(kde-applications kde-system)
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
