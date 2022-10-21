# Maintainer: Max Jöhnk <maxjoehnk@gmail.com>
pkgname=rustic-git
pkgver=r406.d7ce0b5
pkgrel=1
pkgdesc='A self hosted music server with support for many streaming services'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/rustic-music-player/rustic"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'cargo')
provides=('rustic')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-VCS}"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"

    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
	cd "$srcdir/${pkgname%-VCS}"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/rustic"
}
