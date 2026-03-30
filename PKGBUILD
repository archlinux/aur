# Maintainer: robinpie <robin413@protonmail.com>
pkgname=kdominate-git
pkgver=r108.a940a50
pkgrel=1
pkgdesc='Tactical board domination game for one or two players'
arch=(x86_64)
url='https://apps.kde.org/kdominate/'
license=('GPL-2.0-or-later')
depends=(
    gcc-libs
    glibc
    hicolor-icon-theme
    kconfig
    kconfigwidgets
    kcoreaddons
    kcrash
    kdbusaddons
    ki18n
    kiconthemes
    kwidgetsaddons
    kxmlgui
    libkdegames
    qt6-base
    qt6-svg
)
makedepends=(
    extra-cmake-modules
    git
    kdoctools
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("kdominate::git+https://invent.kde.org/games/kdominate")
sha256sums=('SKIP')

pkgver() {
    cd kdominate || return
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -B build -S kdominate \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
