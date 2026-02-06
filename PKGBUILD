pkgname=openmeters-git
pkgver=0.1.0.332.g4a50643
pkgrel=1
pkgdesc="A fast and simple audio metering/visualization program for Linux."
arch=("x86_64")
url="https://github.com/httpsworldview/openmeters"
license=("MIT")
depends=("pipewire" "wayland" "libxkbcommon" "vulkan-icd-loader")
makedepends=("git" "rust" "cargo" "pkgconf" "clang" "pipewire")
provides=("openmeters")
conflicts=("openmeters")
source=("git+https://github.com/httpsworldview/openmeters.git")
sha256sums=("SKIP")
options=('!lto')

pkgver() {
    cd "$srcdir/openmeters"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/openmeters"
    cargo build --locked --release
}

package() {
    cd "$srcdir/openmeters"
    install -Dm755 target/release/openmeters "$pkgdir/usr/bin/openmeters"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
