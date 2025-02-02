# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint-bin
pkgver=0.49.0
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
sha256sums_x86_64=('fa10179ea9272045882b831f10a39e19255abf197d075cd3646aff15fffe227d')
sha256sums_aarch64=('7c7d45fda8f1f0d0e99a4771ff55c639715e5e4b0939dc9160ed8466de63683e')

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
