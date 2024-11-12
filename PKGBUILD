# Maintainer: ganelonhb <worcesterzj@gmail.com>

pkgname=qdiceroller-git
pkgver=1.0.0.r0.geea6ca01ab
pkgrel=1
pkgdesc='A dice roller that uses Qt'
arch=(x86_64)
url=https://github.com/ganelonhb/QDiceRoller
license=(
    GPL-3.0+
)

depends=(
    libglvnd
    libpng
    libxrandr
    xcb-util-cursor
    wayland
    qt6-base
    qt6-svg
)

makedepends=(
    make
    lld
    git
    qt6-tools
)

optdepends=(
    'qt6-wayland: Wayland support'
)

source=(
    git+https://github.com/ganelonhb/QDiceRoller.git
)

pkgver() {
    printf 1.0.0.r0.geea6ca01ab
}

build() {
    printf "Building QDiceRoller..."

    cd "$srcdir/QDiceRoller"
    mkdir build
    cd build

    qmake6 CONFIG+=release ../
    make
}

package() {
    install -Dm755 "$srcdir/QDiceRoller/build/QDiceRoller" \
    "${pkgdir}"/usr/bin/qdiceroller
    install -Dm644 "$srcdir/QDiceRoller/scripts/QDiceRoller.desktop" \
    "${pkgdir}"/usr/share/applications/QDiceRoller.desktop
    install -Dm644 "$srcdir/QDiceRoller/scripts/icon.svg" \
    "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/QDiceRoller.svg
}

pre_remove() {
    rm -f "/usr/bin/qdiceroller"
    rm -f "/usr/share/applications/QDiceRoller.desktop"
    rm -f "/usr/share/icons/hicolor/512x512/apps/QDiceRoller.svg"
}

sha256sums=(
    'SKIP'
)
