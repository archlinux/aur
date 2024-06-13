# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.37.1
pkgrel=0
pkgdesc="Fast and simple Node.js version manager, built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git' 'fnm')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/$_pkgname-linux.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/$_pkgname-arm64.zip")
sha256sums_x86_64=('1937297251aaad0582ea3d07ed6ab6c523641a82ebbfb9f7541a3cb5ae31e1c5')
sha256sums_aarch64=('4be98bcfe7ba5ff5f30e24cc0978474ae9e39f0714c967a2f7e8888b236b526b')

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
