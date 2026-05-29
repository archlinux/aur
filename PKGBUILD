# Maintainer: Aster O'Connor <archlinux dot anatomist477 at passmail dot net>
pkgname=gwenview-aero-git
_pkgname=gwenview-aero
pkgver=r7825.d4f48c31
pkgrel=2
pkgdesc="Aero-styled fork of KDE's Gwenview Image Viewer"
arch=('x86_64')
url="https://gitgud.io/atmk/gwenview-aero"
license=('GPL-2.0-or-later')
install='gwenview-aero.install'
options=('strip' '!debug')
provides=('gwenview')
conflicts=('gwenview')
depends=(
    'wayland-protocols'
    'qt6-base'
    'qt6-multimedia'
    'kcmutils'
    'knewstuff'
    'kcoreaddons'
    'ki18n'
    'kdbusaddons'
    'kbookmarks'
    'kimageannotator'
    'kconfig'
    'kio'
    'kparts'
    'solid'
    'kiconthemes'
    'kcompletion'
    'ktextwidgets'
    'knotifications'
    'kcrash'
    'kwindowsystem'
    'kwidgetsaddons'
    'kcodecs'
    'kguiaddons'
    'kcolorscheme'
    'kfilemetadata'
    'baloo'
    'baloo-widgets'
    'kuserfeedback'
    'packagekit-qt6'
    'libaero-qt-git'
)
makedepends=(
    'git'
    'extra-cmake-modules'
    'kdoctools'
)
source=("git+https://gitgud.io/atmk/gwenview-aero.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # Generates version based on total commit count and short hash (e.g., r123.a1b2c3d)
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -G Ninja -S "$_pkgname" \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DKDE_INSTALL_LIBDIR=lib \
          -DBUILD_TESTING=OFF
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
