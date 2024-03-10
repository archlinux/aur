# Maintainer: Johann Woelper <woelper@gmail.com>
pkgname=oculante
pkgver=0.8.15
pkgrel=1
depends=('aom' 'libwebp' 'expat' 'freetype2' 'gtk3' 'cairo')
makedepends=('rust' 'cargo' 'nasm' 'cmake')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A minimalistic image viewer with analysis and editing tools"
url="https://github.com/woelper/oculante"
source=("$pkgname-$pkgver.tar.gz::https://github.com/woelper/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('SKIP')
license=('MIT')
options=('!lto')

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --locked --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/oculante "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 res/oculante.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
	install -Dm644 res/oculante.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}