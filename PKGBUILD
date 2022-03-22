# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: aksr <aksr at t-com dot me>

## GPG key located at https://github.com/leahneukirchen.gpg

pkgname=mblaze
pkgver=1.2
pkgrel=1
pkgdesc="Unix utilities to deal with Maildir"
arch=('x86_64')
url="https://github.com/leahneukirchen/mblaze"
license=('custom:publicdomain')
depends=('bash' 'gawk')
makedepends=('git')
conflicts=('santoku')
changelog=NEWS.md
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('E6F6848A1B95EE313CF5B7EE95FF633C90A8F025') ## Leah Neukirchen

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README VIOLATIONS.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find contrib filter.example mlesskey.example \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
}
