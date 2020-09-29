# Maintainer: Wenxuan <wenxuangm@gmail.com>
pkgname=code-minimap
pkgver=0.3.1
pkgrel=1
pkgdesc="A high performance code minimap render"
arch=(i686 x86_64)
url="https://github.com/wfxr/code-minimap"
license=("MIT" "APACHE")
depends=()
makedepends=("rust" "cargo")

source=("https://github.com/wfxr/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('38d98daabd2ebf30b5d262e462fbc0d3')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -Dm755 "target/release/${pkgname}"        "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 "completions/fish/${pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
	install -Dm644 "completions/zsh/_${pkgname}"      "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
	install -Dm644 "README.md"                        "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE-MIT"                      "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE"                   "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
