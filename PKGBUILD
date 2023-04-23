# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=rye-git
pkgver=r7.4d13663
pkgrel=1
epoch=
pkgdesc="an experimental alternative to poetry/pip/pipenv/venv/virtualenv/pdm/hatch/…"
arch=(any)
url="https://github.com/mitsuhiko/rye"
license=('MIT')
groups=()
depends=(zlib openssl glibc gcc-libs)
makedepends=(cargo git)
checkdepends=()
optdepends=()
provides=(rye)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/mitsuhiko/rye.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "rye"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd rye
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd rye
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}


check() {
    cd rye
    export RUSTUP_TOOLCHAIN=stable
    # cargo test --frozen --all-features
}

package() {
    cd rye
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/rye"
    install -Dm644 LICENSE* -t $pkgdir/usr/share/licenses/$pkgname/
}
