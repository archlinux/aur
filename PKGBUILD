# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Kibouo <csonka.mihaly@hotmail.com>

pkgname=navi-git
pkgver=2.16.0.r23.gad46a3a
pkgrel=1
pkgdesc='An interactive cheatsheet tool for the command-line.'
arch=('x86_64')
url='https://github.com/denisidoro/navi'
license=('Apache')
depends=('fzf')
optdepends=('skim: drop-in replacement for fzf')
makedepends=('git' 'make' 'cargo')
provides=('navi')
conflicts=('navi')
install='navi.install'
source=("${pkgname}::git+${url}"
        navi.install)
sha256sums=('SKIP'
            '524d552a47da4f16c0608522dc72cd9be292aabfcb4f0a302259ac13a1a16105')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname"
	install -Dm 755 target/release/navi -t "$pkgdir/usr/bin"
	find docs -type f -exec install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" '{}' \;
}
