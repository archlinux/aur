# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.13.4
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
sha256sums_aarch64=('d51b6bbc1c5b42cf1954218262ddaf1f576f05eb1f0a9cbc22bd6b2b969b5da5')
sha256sums_x86_64=('8d74c8034f3d75159782e4934a3782ac21f155d758ff344e353402197bf08bb6')
sha256sums_armv7h=('c402c2d6ba2dbc87c5f9fddcbf7ef8f41f9f5fd8150a28bdf4c2a57c380b3d0e')

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
