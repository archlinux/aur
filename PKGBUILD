# Maintainer: Gyara <laxect39@gmail.com>
# Maintainer: Nanozuki <pt.wenhan@gmail.com>

pkgname=dantalian-rs
_realname="${pkgname%-rs}"
pkgver=0.4.1
pkgrel=1
pkgdesc="A nfo file generator for your anime. Source from Bangumi."
url="https://github.com/nanozuki/dantalian"
makedepends=('cargo')
depends=('openssl')
arch=('i686' 'x86_64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nanozuki/$_realname/archive/v$pkgver.tar.gz")
sha512sums=('17abac2a428c75b5d84851df0ee3e581956270eb58042688e067e186ae507e724143a97afa85b66c566668282160888310d7e12ecae1e26c444617bc03c7734b')

build() {
	cd "$_realname-$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$_realname-$pkgver"
	install -Dm755 "target/release/$_realname" "$pkgdir/usr/bin/$_realname"
  install -Dm644 target/release/build/dantalian-*/out/dantalian.bash "$pkgdir"/usr/share/bash-completion/completions/dantalian
  install -Dm644 target/release/build/dantalian-*/out/dantalian.fish "$pkgdir"/usr/share/fish/vendor_completions.d/dantalian.fish
  install -Dm644 target/release/build/dantalian-*/out/_dantalian "$pkgdir"/usr/share/zsh/site-functions/_dantalian
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_realname}"
}

# vim:set ts=2 sw=2 et:
