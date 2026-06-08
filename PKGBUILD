# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pranav <pranav.sharma.ama@gmail.com>
# Contributor: Neptune <neptune650@proton.me>
# Contributor: Bjoern Franke <bjo+aur<at>schafweide.org>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=mir
pkgver=2.28.0
pkgrel=1
pkgdesc="Canonical's display server"
url="https://github.com/canonical/mir"
arch=(x86_64 i686)
license=('GPL-2.0-or-later OR GPL-3.0-or-later')
depends=(
    boost-libs
    egl-wayland
    freetype2
    glib2
    glibc
    glibmm
    gtest
    hicolor-icon-theme
    libdisplay-info
    libdrm
    libepoxy
    libgcc
    libglvnd
    libinput
    libstdc++
    libx11
    libxcb
    libxcursor
    libxkbcommon
    libxkbcommon-x11
    libxml++2.6
    lttng-ust
    mesa
    pixman
    sh
    systemd-libs
    util-linux-libs
    wayland
    yaml-cpp
    )
makedepends=(
    boost
    cargo
    cmake
    doxygen
    git
    glib2-devel
    glm
    glmark2
    graphviz
    python-dbus
    python-dbusmock
    python-pillow
    umockdev
    wlcs
    xorg-xwayland
    )
optdepends=('qterminal: required for miral demos'
            'ttf-ubuntu-font-family: required for miral demos'
            'qt5-wayland: required for miral demos'
            'xcursor-dmz: opt requirement for miral demos')
options=(!lto)
source=("git+https://github.com/canonical/mir.git#tag=v${pkgver}") # build issue with 2.26.0 archive
sha256sums=('89587c88303a19f5183128cc017639b7e17e935f4af0ab4935635e2c741964fa')

build() {
  local _flags=(
    -DMIR_FATAL_COMPILE_WARNINGS=OFF
    #-DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/mir/
    -DMIR_BUILD_INTERPROCESS_TESTS=OFF
    -DMIR_USE_PRECOMPILED_HEADERS=OFF
    -DMIR_FATAL_COMPILE_WARNINGS=OFF
    -DMIR_ENABLE_WLCS_TESTS=OFF
    -DMIR_RUN_WLCS_TESTS=OFF
    -DMIR_USE_LD=ld
  )

  cmake -B build -S "mir" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

#check() {
#  ctest --test-dir build --output-on-failure
#}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
