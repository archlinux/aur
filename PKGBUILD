# Maintainer: Gyara <laxect39@gmail.com>
# Maintainer: Nanozuki <pt.wenhan@gmail.com>

pkgname=dantalian-rs
_realname="${pkgname%-rs}"
pkgver=0.4.0
pkgrel=1
pkgdesc="A nfo file generator for your anime. Source from Bangumi."
url="https://github.com/nanozuki/dantalian"
makedepends=('cargo')
depends=('openssl')
arch=('i686' 'x86_64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nanozuki/$_realname/archive/v$pkgver.tar.gz")
sha512sums=('55ea0128542e1fc4950f8c2bf7760cfed7aacaa57c73083742d9ea1c06d6c34672a1b8a361a17a0252565a150615a60edd8304cd123d8f1e7952146ee99b8401')

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
