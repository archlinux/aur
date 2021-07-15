# Maintainer: Gyara <laxect39@gmail.com>
# Maintainer: Nanozuki <pt.wenhan@gmail.com>

pkgname=dantalian-rs
_realname="${pkgname%-rs}"
pkgver=0.3.2
pkgrel=1
pkgdesc="A nfo file generator for your anime. Source from Bangumi."
url="https://github.com/nanozuki/dantalian"
makedepends=('cargo')
depends=('openssl')
arch=('i686' 'x86_64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nanozuki/$_realname/archive/v$pkgver.tar.gz")
sha512sums=('804014de7711393b7691f27d950018aee114c955231d2a5188b760a41f07d0986e8e40c71c83819746ebdf1657a70c1ed387945704f20d14292ea7254286ea71')

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
