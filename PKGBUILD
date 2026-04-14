# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="letta-code"
pkgname="$_pkgname"
pkgver=0.23.4
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
sha256sums=('cca0a9909384262ce0fe6d329fb85260c8b8f6be11b8b7175b5478fe2ab6ca88'
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
