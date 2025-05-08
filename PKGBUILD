# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.13.5
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=("aarch64" "x86_64" "armv7h")
url="https://github.com/Enter-tainer/typstyle"
license=("Apache-2.0")
depends=("gcc-libs" "glibc")
optdepends=("typst: For typst compilation")
provides=("$_pkgname")
conflicts=("$_pkgname")
source_aarch64=("$_pkgname-aarch64-$pkgver::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu")
source_armv7h=("$_pkgname-armv7h-$pkgver::$url/releases/download/v$pkgver/$_pkgname-arm-unknown-linux-gnueabihf")
source_x86_64=("$_pkgname-x86_64-$pkgver::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu")
sha256sums_aarch64=('72f0456e420bf45fdd921b25def772c0f6236981e5a3c9dd7a8666db622a0587')
sha256sums_x86_64=('fb6f38d122d443c771731c9cb1cea42e2b68793fc7184d17d7257c62810b48c5')
sha256sums_armv7h=('febfce77e645645293f7d3061d6bdfedc7a7d417e407285b0563d76449b786e1')

package() {
	install -Dm755 "$_pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgname"

    mkdir -p "completions"
	for shell in bash zsh fish; do
        "$pkgdir/usr/bin/$_pkgname" completions $shell >completions/$_pkgname-completion.$shell
    done

	install -Dm644 "completions/$_pkgname-completion.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "completions/$_pkgname-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -Dm644 "completions/$_pkgname-completion.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
