# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint-bin
pkgver=0.50.0
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
sha256sums_x86_64=('f68122411325908f076f65e02d03103c9dbb9feabe80c8fbca8f81b7e8cd2512')
sha256sums_aarch64=('827129b278ad82acd12490488ba1fd981eb21f8c3bfa83c828d9dba4aa1b59f1')

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
