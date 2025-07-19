# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.13.16
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=("aarch64" "x86_64" "armv7h")
url="https://github.com/typstyle-rs/typstyle"
license=("Apache-2.0")
depends=("gcc-libs" "glibc")
optdepends=("typst: For typst compilation")
provides=("$_pkgname")
conflicts=("$_pkgname")
source_aarch64=("$_pkgname-aarch64-$pkgver::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu")
source_armv7h=("$_pkgname-armv7h-$pkgver::$url/releases/download/v$pkgver/$_pkgname-arm-unknown-linux-gnueabihf")
source_x86_64=("$_pkgname-x86_64-$pkgver::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu")
sha256sums_aarch64=('57ec033da0f28553d7f5b148c18d6081908255ed9ba4f248be64c288a8f505b6')
sha256sums_x86_64=('b38e325c6f499683a2af263edd6192379bf02224f944966fb9e00089f79feb86')
sha256sums_armv7h=('6e9aa6301076a279194c4662564aa1ff0e68948c2734a732ba4353631a7f6e82')

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
