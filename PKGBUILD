# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox
pkgver=0.7
pkgrel=2
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
	"LICENSE::https://raw.githubusercontent.com/emoeem/voicefox/f814e545f327d28db8d71832648330b9f97d3020/LICENSE"
)
sha512sums=('8da4eae39d93214ab1cebd7d9a83e2f082e4752301f7eeabb526caebb3779cbe02821559be671028dd616b4f9c80cbd707d017dd44d87be10a38c2a025d68cbf'
            'b083d9572511a96dbb86ffcf02e8ff843a5268062fffb65ca17b277a859b9648aaa6c3eadc72941a5f83e23e6fb6829c932a9f25c91260b673817af663ba830b')

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
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
