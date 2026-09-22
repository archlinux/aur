# Maintainer: Luke Taylor <luket@pm.me>

pkgname=fooyin-plugin-vgmstream-git
pkgver=1.0.3.r0.g6d47871
pkgrel=1
pkgdesc="A vgmstream input plugin for fooyin"
url="https://github.com/fooyin/fooyin-plugin-vgmstream"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
    fooyin
    vgmstream-git
)
makedepends=(
    cmake
    git
    ninja
)
source=(
    "$pkgname"::"git+https://github.com/fooyin/fooyin-plugin-vgmstream.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    local cmake_options=(
        -B build
        -S "$pkgname"
        -W no-author
        -G Ninja
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )

    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
