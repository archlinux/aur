# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=timerrs
pkgver=0.1.6
pkgrel=1
pkgdesc="A simple timer for the terminal"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Aethar01/timerrs"
license=('MIT')
makedepends=('cargo')
optdepends=('dunst: notifications with progress bars'
			'libnotify: for sending notifications')
provides=('timerrs')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
	cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
	cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 target/release/${pkgname} "$pkgdir/usr/bin/${pkgname}"
    install -Dm755 target/release/${pkgname}ctl "$pkgdir/usr/bin/${pkgname}ctl"
}
