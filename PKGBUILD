# Maintainer: Dario Banfi <hello@dariobanfi.com>

pkgname=anthropic-cli-bin
_pkgname=anthropic-cli
pkgver=1.21.0
pkgrel=1
pkgdesc="The official CLI for the Claude API (ant)"
arch=('x86_64' 'aarch64' 'i686' 'armv6h')
url="https://github.com/anthropics/anthropic-cli"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" 'ant')
options=('!strip' '!debug')

_relurl="$url/releases/download/v$pkgver"

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/anthropics/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$_relurl/ant_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$_relurl/ant_${pkgver}_linux_arm64.tar.gz")
source_i686=("$_pkgname-$pkgver-i686.tar.gz::$_relurl/ant_${pkgver}_linux_386.tar.gz")
source_armv6h=("$_pkgname-$pkgver-armv6h.tar.gz::$_relurl/ant_${pkgver}_linux_armv6.tar.gz")

sha256sums=('8bf96984ff8bcfae7e48cae76a529e8a25317ba9e02abf7fd3cc64fdf95657a6')
sha256sums_x86_64=('dabd2c9425b18052ca6a610c1ecbdbabcd4c3cca409df943d264ad5e9969bb98')
sha256sums_aarch64=('5e2f1fce4ac714c71a48a50fb43f57d45dbf7012f7bfb7ca6c05e160bb29ad02')
sha256sums_i686=('b3c90e8286ab16b4750c2c514c005cc10ff18f13b726096d5d9b93300c9eab6a')
sha256sums_armv6h=('56e7beb4492370faa4f375fa99a484fdbf0d6edeb96ff41ffcbbb3f02d528c77')

package() {
	install -Dm755 "$srcdir/ant" "$pkgdir/usr/bin/ant"

	install -Dm644 "$srcdir/completions/ant.bash" \
		"$pkgdir/usr/share/bash-completion/completions/ant"
	install -Dm644 "$srcdir/completions/ant.fish" \
		"$pkgdir/usr/share/fish/vendor_completions.d/ant.fish"
	install -Dm644 "$srcdir/completions/ant.zsh" \
		"$pkgdir/usr/share/zsh/site-functions/_ant"

	install -Dm644 "$srcdir/man/man1/ant.1.gz" \
		"$pkgdir/usr/share/man/man1/ant.1.gz"

	install -Dm644 "$srcdir/LICENSE-$pkgver" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
