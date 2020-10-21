# Maintainer: Wenxuan Zhang <wenxuangm@gmail.com>
pkgname=csview
_binname=csview
pkgver=0.3.5
pkgrel=2
pkgdesc="A high performance csv viewer with cjk/emoji support"
arch=(i686 x86_64)
url="https://github.com/wfxr/csview"
license=("MIT" "APACHE")
depends=()
makedepends=("rust" "cargo")
conflicts=("csview-git" "csview-bin")

source=("https://github.com/wfxr/csview/archive/v${pkgver}.tar.gz")
md5sums=('f97909c070d2dacaeba8fc5f98926a12')

build() {
	cd "$srcdir/${_binname}-${pkgver}"
	cargo build --release
}

package() {
	cd "$srcdir/${_binname}-${pkgver}"
	install -Dm755 "target/release/${_binname}"        "$pkgdir/usr/bin/${_binname}"
	install -Dm644 "completions/fish/${_binname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_binname}.fish"
	install -Dm644 "completions/zsh/_${_binname}"      "$pkgdir/usr/share/zsh/site-functions/_${_binname}"
	install -Dm644 "README.md"                        "$pkgdir/usr/share/doc/${_binname}/README.md"
	install -Dm644 "LICENSE-MIT"                      "$pkgdir/usr/share/licenses/${_binname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE"                   "$pkgdir/usr/share/licenses/${_binname}/LICENSE-APACHE"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
