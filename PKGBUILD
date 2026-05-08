# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="letta-code"
pkgname="$_pkgname"
pkgver=0.25.2
pkgrel=1
pkgdesc="The memory-first coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/letta-ai/letta-code"
license=('Apache-2.0')
depends=('nodejs' 'bun' 'org.freedesktop.secrets' 'imagemagick>=7')
conflicts=(
    # "$_pkgname"
    "$_pkgname-bin"
    "$_pkgname-git"
)
source=(
	"$_pkgname-$pkgver.tar.gz::$url/archive/v"$pkgver".tar.gz"
	"letta"
)
noextract=()
options=(!strip)
sha256sums=('b40936d01d9454828981357d8dd3b079ca3d022f279f198b41e5471a31a54db9'
            'c9350b744337f0a0b0c51e1a8661e8c7bc757fcc753bddaef872b0ef626228e8')

build() {
	cd "${_pkgname}-${pkgver}"
	
	export USE_MAGICK=1
	bun install
	bun run build
}

package() {
    install -Dm755 "${_pkgname}-${pkgver}/letta.js" "${pkgdir}/usr/share/letta/letta.js"
    install -Dm755 "${srcdir}/letta" "${pkgdir}/usr/bin/letta"
}
