# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.36.0
pkgrel=0
pkgdesc="Fast and simple Node.js version manager, built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git' 'fnm')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/$_pkgname-linux.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/$_pkgname-arm64.zip")
sha256sums_x86_64=('35bd997851d35cf9e12a36233f427240c295778994ff5c6db2b88d7b7685ee5e')
sha256sums_aarch64=('841e9426aef32faa252040220e193baf618525d9b5c9743f12c8a277f476bb03')

package() {
	install -Dm755 fnm "$pkgdir/usr/bin/$_pkgname"

	mkdir -p \
		"$pkgdir"/usr/share/bash-completion/completions \
		"$pkgdir"/usr/share/fish/vendor_completions.d \
		"$pkgdir"/usr/share/zsh/site-functions
	"$pkgdir/usr/bin/$_pkgname" completions --shell bash >"$pkgdir"/usr/share/bash-completion/completions/$_pkgname
	"$pkgdir/usr/bin/$_pkgname" completions --shell fish >"$pkgdir"/usr/share/fish/vendor_completions.d/$_pkgname.fish
	"$pkgdir/usr/bin/$_pkgname" completions --shell zsh >"$pkgdir"/usr/share/zsh/site-functions/_$_pkgname
}
