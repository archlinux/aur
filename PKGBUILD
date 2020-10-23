# Maintainer: Wenxuan Zhang <wenxuangm@gmail.com>
_pkgname=csview
pkgname=csview
pkgver=0.3.5
pkgrel=2
pkgdesc="A high performance csv viewer with cjk/emoji support"
arch=(i686 x86_64)
url='https://github.com/wfxr/csview'
license=('MIT' 'APACHE')
depends=()
makedepends=('rust' 'cargo')
conflicts=("csview-git" "csview-bin")
provides=()

source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('f97909c070d2dacaeba8fc5f98926a12')

build() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	install -Dm755 "target/release/${_pkgname}"        "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "completions/fish/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm644 "completions/zsh/_${_pkgname}"      "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "README.md"                         "$pkgdir/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 "LICENSE-MIT"                       "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE"                    "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
