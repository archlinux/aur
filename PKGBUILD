# Maintainer: Daniel Dada <dan@binarygoose.dev>
pkgname=clrsync-git
pkgver=r107.4229db4
pkgrel=1
pkgdesc="Color scheme manager (git version)"
arch=('x86_64')
url="https://github.com/obsqrbtz/clrsync"
license=('MIT')
options=(!debug)
depends=(
    glfw
    freetype2
    fontconfig
    zlib
    harfbuzz
    mesa
    libglvnd
    libxcursor
    gtk3
)

makedepends=(
  cmake
  git
  glfw
  libx11
  libxrandr
  libxi
  libxinerama
  libxcursor
  wayland
  wayland-protocols
  gtk3
)
provides=('clrsync')
conflicts=('clrsync')
source=("$pkgname::git+https://github.com/obsqrbtz/clrsync.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_SYSTEM_GLFW=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
