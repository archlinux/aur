# Maintainer: Gyara <laxect39@gmail.com>
# Maintainer: Nanozuki <pt.wenhan@gmail.com>

pkgname=dantalian-rs
_realname="${pkgname%-rs}"
pkgver=0.4.5
pkgrel=1
pkgdesc="A nfo file generator for your anime. Source from Bangumi."
url="https://github.com/nanozuki/dantalian"
makedepends=('cargo')
depends=('openssl' 'gcc-libs')
arch=('i686' 'x86_64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nanozuki/$_realname/archive/v$pkgver.tar.gz")
sha512sums=('165db498c993bff967907d5d10c42c14b199c4a63cc5614a6d5957fe740f34d2f76e1aca144898300fc9721fb9108ca168ba625c8e1377600e5ce47c32b2d4d7')

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
