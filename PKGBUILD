# Maintainer: Gyara <laxect39@gmail.com>
# Maintainer: Nanozuki <pt.wenhan@gmail.com>

pkgname=dantalian-rs
_realname="${pkgname%-rs}"
pkgver=0.3.1
pkgrel=1
pkgdesc="A nfo file generator for your anime. Source from Bangumi."
url="https://github.com/nanozuki/dantalian"
makedepends=('cargo')
depends=('openssl')
arch=('i686' 'x86_64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nanozuki/$_realname/archive/v$pkgver.tar.gz")
sha512sums=('7d92b1ed6fbcc765f7befce940dbe7526b936d547b4ad46c90da82b3bf1893c63adf25e4915f5164bb2a4ed3176c438dcb676b7c3f967316e0e777e2365f81e7')

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
