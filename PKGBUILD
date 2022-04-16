# Maintainer: Hisbaan Noorani <hisbaan@gmail.com>
pkgname=didyoumean-git
pkgver=1.0.r7.2099456
pkgrel=1
pkgdesc="A cli spelling corrector"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/hisbaan/didyoumean"
license=('GPL3')
makedepends=('git' 'cargo')
provides=("dym")
conflicts=("dym")
source=('git+https://github.com/hisbaan/didyoumean')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$srcdir/${pkgname%-git}"
    cargo build --locked  --release --all-features
}

package() {
	cd "$srcdir/${pkgname%-git}"

    install -Dm755 target/release/dym -t "${pkgdir}/usr/bin/"

    install -Dm644 docs/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
    install -Dm644 docs/README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
}
