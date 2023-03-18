# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=spectacle
pkgname=${_name}-git
pkgver=22.04.0.r311.gca6de42
pkgrel=1
pkgdesc='KDE screenshot capture utility'
arch=('x86_64')
url='https://apps.kde.org/spectacle/'
license=('GPL')
groups=('kde-applications' 'kde-graphics')
provides=("${_name}")
conflicts=("${_name}")
depends=('xcb-util-cursor' 'purpose' 'knewstuff' 'qt5-tools' 'kpipewire')
makedepends=('git' 'extra-cmake-modules' 'kdoctools' 'plasma-wayland-protocols')
source=("git+https://invent.kde.org/graphics/spectacle.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_name}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B "build" -S "${_name}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
