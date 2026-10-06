# Maintainer: Malte Jürgens <maltejur@dismail.de>

_pkgname=plasma-studio
pkgname=$_pkgname-git
pkgver=r1887.931c24c
pkgrel=1
pkgdesc="Node-based multimedia editor for video, photos and vector graphics"
arch=(x86_64)
url="https://invent.kde.org/niccolove/plasma-studio"
license=(GPL-2.0-or-later)
depends=(
    ffmpeg
    glib2
    glibc
    hicolor-icon-theme
    kconfigwidgets
    ki18n
    kiconthemes
    kirigami
    kirigami-addons
    libgcc
    libglvnd
    libraw
    libsecret
    libstdc++
    libva
    mpv
    qt6-base
    qt6-declarative
    qt6-multimedia
    qt6-quick3d
    wayland
    zlib
    )
makedepends=(
    cmake
    git
    kguiaddons
    libdrm
    qt6-shadertools
    vulkan-headers
    )
provides=($_pkgname)
conflicts=($_pkgname)
options=()
source=("git+https://invent.kde.org/niccolove/plasma-studio.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local cmake_options=(
    -B build
    -S $_pkgname
    -W no-author
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_WITH_INSTALL_RPATH=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm "$pkgdir"/usr/lib/qt6/qml/Studio/studioplugin_qml_module_dir_map.qrc
}
