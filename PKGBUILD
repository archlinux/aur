# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=miracle-wm-git
pkgver=0.11.1.r4.g893de69
pkgrel=1
pkgdesc="Wayland tiling window manager built on Mir"
arch=(x86_64)
url="https://github.com/miracle-wm-org/miracle-wm"
license=(GPL-3.0-only)
depends=(
    cairo
    glib2
    glibc
    gtk4
    gtk4-layer-shell
    json-c
    libgcc
    libglvnd
    libnotify
    libstdc++
    libxkbcommon
    mir
    pcre2
    python
    sh
    wasmedge
    wayland
    yaml-cpp
    )
makedepends=(
    boost
    cmake
    git
    glm
    nlohmann-json
    )
provides=(miracle-wm)
conflicts=(miracle-wm)
source=("git+https://github.com/miracle-wm-org/miracle-wm.git")
sha256sums=('SKIP')

pkgver() {
  cd "miracle-wm"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DSYSTEMD_INTEGRATION=ON
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/miracle-wm/
  )

  cmake -B build -S "miracle-wm" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
