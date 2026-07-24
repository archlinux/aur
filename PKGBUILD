# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox
pkgver=0.8
pkgrel=1
pkgdesc="A TUI music player that supports both streaming and local tracks"
arch=("x86_64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
options=(!lto)
depends=(
	"glibc"
	"libgcc"
	"openssl"
	"mpv"
	"nodejs"
)
makedepends=(
	"rust"
)
source=(
	"${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
)
sha512sums=('50e4fa76215ac9391a6001afc9425fc9d4ec9ed1fb7102fe1e6b5c153a5c030c3febb13539481df32cb134e125c1a52b8cf9c5f9509d6ea39047fe57a1cf572e')

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --release --frozen
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 -t "${pkgdir}/usr/bin" target/release/voicefox
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
