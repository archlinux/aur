# Maintainer: Wenxuan Zhang <wenxuangm@gmail.com>
pkgname=csview
binname=csview
pkgver=0.3.5
pkgrel=1
pkgdesc="A high performance csv viewer with cjk/emoji support"
arch=(i686 x86_64)
url="https://github.com/wfxr/csview"
license=("MIT" "APACHE")
depends=()
makedepends=("rust" "cargo")

source=("https://github.com/wfxr/csview/archive/v${pkgver}.tar.gz")
md5sums=('f97909c070d2dacaeba8fc5f98926a12')

build() {
	cd "$srcdir/${binname}-${pkgver}"
	cargo build --release
}

package() {
	cd "$srcdir/${binname}-${pkgver}"
	install -Dm755 "target/release/${binname}"        "$pkgdir/usr/bin/${binname}"
	install -Dm644 "completions/fish/${binname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${binname}.fish"
	install -Dm644 "completions/zsh/_${binname}"      "$pkgdir/usr/share/zsh/site-functions/_${binname}"
	install -Dm644 "README.md"                        "$pkgdir/usr/share/doc/${binname}/README.md"
	install -Dm644 "LICENSE-MIT"                      "$pkgdir/usr/share/licenses/${binname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE"                   "$pkgdir/usr/share/licenses/${binname}/LICENSE-APACHE"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
