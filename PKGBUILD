# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.13.7
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
sha256sums_aarch64=('4c44539318a3a031c3d457ddb03af3b6138af5724195ba348cdb9a3db4b08a42')
sha256sums_x86_64=('1ead30d748a2435a43ab3b0ad8c6114bfa68f3bad06249091b377b77d6579831')
sha256sums_armv7h=('d1e4a75c71b2f4b32b7c4b5b1c87e1028ba929054db06bc7f6488d32e6d24395')

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
