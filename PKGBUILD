# Maintainer: Wenxuan <wenxuangm@gmail.com>
pkgname=csview
pkgver=0.3.3
pkgrel=2
pkgdesc="A high performance csv viewer with cjk/emoji support."
arch=(x86_64)
url="https://github.com/wfxr/csview"
license=("MIT" "APACHE")
depends=()
makedepends=("rust" "cargo")

source=("https://github.com/wfxr/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("672f4912f98226f4e62fba88085de49b")


build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -Dm755 "target/release/${pkgname}"        "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 "completions/fish/${pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
	install -Dm644 "completions/zsh/_${pkgname}"      "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
	install -Dm644 "README.md"                        "$pkgdir/usr/share/doc/README.md"
	install -Dm644 "LICENSE-MIT"                      "$pkgdir/usr/share/doc/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE"                   "$pkgdir/usr/share/doc/LICENSE-APACHE"
}
