# Maintainer: l-koehler <lorenz.koehler@posteo.de>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux,org>

pkgname=dolphin-git
pkgver=24.01.90.r204.g41df5fa02
pkgrel=2
pkgdesc='KDE File Manager (git)'
arch=(i686 x86_64)
url=https://kde.org/applications/system/dolphin
license=('GPL-2.0-or-later')
depends=(knewstuff kcmutils kparts ktextwidgets kdoctools phonon-qt6 plasma-activities)
makedepends=(extra-cmake-modules git)
optdepends=('kde-cli-tools: for editing file type options'
            'ffmpegthumbs: video thumbnails'
            'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel'
            'purpose: share context menu'
	    'kuserfeedback: submission of telemetry data'
            'baloo-widgets'
            'kio-extras')
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
