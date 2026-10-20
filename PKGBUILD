# Maintainer: Chaos-Tic <58691435+Chaos-Tic@users.noreply.github.com>
# Built by packaging/linux/build-package.sh arch, which sets pkgver from
# Cargo.toml. For the AUR, aur.sh fills in the release tarball's checksum.
pkgname=lyapunov
pkgver=0.1.0
pkgrel=1
pkgdesc='Save an activity as a card and resume it later'
arch=('x86_64')
url='https://github.com/Chaos-Tic/Lyapunov'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'gcc-libs' 'glibc')
makedepends=('cargo' 'cmake')
optdepends=(
    'xdg-utils: open folders and documents with their usual application'
    'qt6-wayland: native Wayland window'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('10537cfa612062a9817b9e909113036ab6700938026c44c2e483bf115c7d1358')

build() {
    cd "Lyapunov-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF
    cmake --build build
}

check() {
    cd "Lyapunov-$pkgver"
    cargo test --release --locked
}

package() {
    cd "Lyapunov-$pkgver"
    sh packaging/linux/stage.sh "$pkgdir"
}
