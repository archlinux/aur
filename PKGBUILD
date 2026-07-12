# Maintainer: MartorSkull <livemartor at gmail dot com>
_gitrepo=plasma-workspace
_pkgcat=xembedsniproxy
pkgname=${_pkgcat}
pkgver=6.7.2
pkgrel=0
epoch=0
pkgdesc='Make xembed based tray icons work inside Wayland sessions'
arch=('x86_64')
url='https://invent.kde.org/plasma/plasma-workspace/tree/master/xembed-sni-proxy'
license=('LGPL-2.1-or-later')
depends=(
    'gcc-libs' 'glibc' 'kcoreaddons' 'kcrash' 'kdbusaddons' 'kwindowsystem'
    'libxcb' 'libxtst' 'qt6-base' 'xcb-util' 'xcb-util-image')
makedepends=(
    'appstream-qt' 'baloo' 'base-devel' 'extra-cmake-modules' 'git' 'kded'
    'kglobalacceld' 'knotifyconfig' 'kparts' 'krunner' 'kscreen'
    'kstatusnotifieritem' 'ktexteditor' 'ktextwidgets' 'kuserfeedback' 'kwayland'
    'kwin' 'libqalculate' 'networkmanager-qt' 'packagekit-qt6' 'phonon-qt6'
    'plasma-activities' 'plasma-activities-stats' 'plasma-wayland-protocols'
    'prison' 'qcoro' 'qt6-location' 'qt6-wayland' 'wayland-protocols' 'xdotool')
source=("$_gitrepo::git+https://invent.kde.org/plasma/plasma-workspace.git#tag=v$pkgver")
sha256sums=('7bc459a6f0bd7090dd610f08b4860f743cc53a457c865b94d1bc32452ee4f3b2')

build() {
    cd "$srcdir/$_gitrepo"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -Dkglobalacceld_PATH=/usr/lib/kglobalacceld
    cd build
    make $MAKEFLAGS xembedsniproxy
}

package() {
    cd "$srcdir/"
    install -Dm755 $_gitrepo/build/bin/${_pkgcat} "${pkgdir}/usr/bin/${_pkgcat}"
}
