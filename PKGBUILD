# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

pkgname=thqm
pkgdesc='Control your scripts over the network.'
pkgver=0.1.3
pkgrel=1
arch=('any')
url='https://github.com/loiccoyle/thqm.rs'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/loiccoyle/thqm.rs/archive/v${pkgver}.tar.gz")
sha256sums=('20e91dabd08f2d707bc79d3bbfb43cddae32f0f5c388b3c637e5745b3998cd7e')

build() {
	cd "$pkgname.rs-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname.rs-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# completions
	install -Dm644 "completions/$pkgname" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 "completions/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
	install -Dm644 "completions/_$pkgname"  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
