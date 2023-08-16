# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.35.1
pkgrel=0
pkgdesc="Fast and simple Node.js version manager, built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git' 'fnm')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/$_pkgname-linux.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/$_pkgname-arm64.zip")
sha256sums_x86_64=('cf2d34df1f1ed89742d75eba2920af376a756d1eee5eb319821d6dd1366ed9e1')
sha256sums_aarch64=('2dddd02879e81527d71d57ef13157f1c95ed571ec10fd99c5f3481912f6ab11a')

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
