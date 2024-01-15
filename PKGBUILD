_name='aw-watcher-media-player'
pkgname="$_name-git"
pkgver=r16.d1da62f
pkgrel=1
pkgdesc="Watcher of system's currently playing media for ActivityWatch"
arch=('x86_64')
url="https://github.com/2e3s/$_name"
license=('Unlicense')

depends=(
    activitywatch
)
makedepends=(
    git
    cargo
)
provides=(${_name})
conflicts=(
    ${_name}
)

source=("${_name}::git+$url")
sha256sums=('SKIP')


pkgver() {
    cd "${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_name}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_name}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release

}

package() {
    cd "${_name}"
    install -Dm0755 ./target/release/aw-watcher-media-player -t "${pkgdir}/usr/bin/"
}

