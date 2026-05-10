pkgname=spencer-macro
pkgver=3.2.1
pkgrel=1
pkgdesc="Spencer Macro Utilities"
arch=('x86_64')
url="https://github.com/Spencer0187/Spencer-Macro-Utilities"
license=('GPL3')
depends=(
    'libx11'
    'libxext'
    'libxkbcommon'
    'mesa'
    'dbus'
    'systemd-libs'
)
makedepends=(
    'base-devel'
    'git'
    'cmake'
    'pkg-config'
)
source=(
    "$pkgname::git+https://github.com/Spencer0187/Spencer-Macro-Utilities.git"
    "spencer-macro.desktop"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make -j"$(nproc)"
}

package() {
    cd "$srcdir/$pkgname/build"
    install -Dm755 suspend "$pkgdir/usr/bin/spencer-macro"
    install -Dm755 lib/libSDL3.so.0.4.4 "$pkgdir/usr/lib/spencer-macro/libSDL3.so.0.4.4"
    ln -s /usr/lib/spencer-macro/libSDL3.so.0.4.4 "$pkgdir/usr/lib/spencer-macro/libSDL3.so.0"
    install -Dm644 ../assets/LSANS.TTF "$pkgdir/usr/share/spencer-macro/LSANS.TTF"
    install -Dm644 ../assets/smu_icon.bmp "$pkgdir/usr/share/spencer-macro/smu_icon.bmp"
    install -Dm644 "$srcdir/spencer-macro.desktop" "$pkgdir/usr/share/applications/spencer-macro.desktop"
}
