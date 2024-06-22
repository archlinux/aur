# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin-no-explicit-sync
_pkgname=kwin
pkgver=6.1.0
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=3.2
pkgdesc='An easy to use, but flexible, composited Window Manager(with a simple patch to disable explicit sync)'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
conflicts=(kwin)
provides=(kwin)
depends=(
    breeze
    gcc-libs
    glibc
    plasma-activities
    kauth
    kcmutils
    kcolorscheme
    kconfig
    kconfigwidgets
    kcoreaddons
    kcrash
    kdbusaddons
    kdeclarative
    kdecoration
    kglobalaccel
    kglobalacceld
    kguiaddons
    ki18n
    kidletime
    kirigami
    kitemmodels
    knewstuff
    knotifications
    kpackage
    kquickcharts
    kscreenlocker
    kservice
    ksvg
    kwayland
    kwidgetsaddons
    kwindowsystem
    kxmlgui
    lcms2
    libdisplay-info
    libdrm
    libei
    libepoxy
    libinput
    libpipewire
    libqaccessibilityclient-qt6
    libx11
    libxcb
    libxcvt
    libxi
    libxkbcommon
    libxkbcommon-x11
    mesa
    pipewire-session-manager
    libplasma
    qt6-5compat
    qt6-base
    qt6-declarative
    qt6-multimedia
    qt6-sensors
    qt6-tools
    qt6-wayland
    systemd-libs
    wayland
    xcb-util-cursor
    xcb-util-keysyms
    xcb-util-wm
)
makedepends=(
    git
    extra-cmake-modules
    kdoctools
    krunner
    plasma-wayland-protocols
    python
    wayland-protocols
    xorg-xwayland
)
optdepends=('maliit-keyboard: virtual keyboard for kwin-wayland')
groups=(plasma)
source=(
    "git+https://invent.kde.org/plasma/kwin.git#tag=v$pkgver"
    "no-explicit-sync.patch"
)
install=$_pkgname.install
sha256sums=(
    'SKIP'
    '3424c7ee145bbc84530338df13ffe1b16a9668bf985e10c7ecff0ebfeb72eaaf'
)

prepare() {
    cd "$srcdir/$_pkgname"
    patch -Np1 <"$srcdir/no-explicit-sync.patch"
}

build() {
    cmake -B build -S $_pkgname \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DBUILD_TESTING=OFF
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
