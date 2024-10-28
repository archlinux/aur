# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint-bin
pkgver=0.47.5
pkgrel=1
pkgdesc='Pluggable and configurable code formatting platform'
arch=('x86_64' 'aarch64')
url='https://github.com/dprint/dprint'
license=('MIT')
depends=('gcc-libs')
provides=('dprint')
conflicts=('dprint')
source=('LICENSE')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/$pkgver/dprint-x86_64-unknown-linux-gnu.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::$url/releases/download/$pkgver/dprint-aarch64-unknown-linux-gnu.zip")
sha256sums=('43f8cfbeca17eccd83fc98f27d211073eaee5574fc3162f345acc196d6190ce7')
sha256sums_x86_64=('123c20d147485e4cac60823e63c13f2cf9157615e5ffea61b431243f61227343')
sha256sums_aarch64=('dfb1e4046d6a48ccaa7fbdcc0c64a23ad8da12463b67a1b08737d5a94e144e48')

package() {
    # generate shell completions
    install -d "$pkgdir/usr/share/bash-completion/completions/" \
               "$pkgdir/usr/share/elvish/lib/" \
               "$pkgdir/usr/share/fish/vendor_completions.d/" \
               "$pkgdir/usr/share/zsh/site-functions/"
    ./dprint completions bash > "$pkgdir/usr/share/bash-completion/completions/dprint"
    ./dprint completions elvish > "$pkgdir/usr/share/elvish/lib/dprint.elv"
    ./dprint completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/dprint.fish"
    ./dprint completions zsh > "$pkgdir/usr/share/zsh/site-functions/_dprint"

	install -Dv dprint -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
