# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cod
pkgver=0.0.0
pkgrel=3
pkgdesc="A completion daemon for bash/zsh"
arch=('any')
url="https://github.com/dim-an/cod"
license=('Apache-2.0')
makedepends=('go')
optdepends=('bash-completion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dim-an/cod/archive/v$pkgver.tar.gz")
sha256sums=('6f773358f363141dcd1bbdffaaa5dea0a40ae7a84d5fc55fd453302de8493c20')

build() {
	cd "$pkgname-$pkgver"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags \"${LDFLAGS}\"" \
		-o "$pkgname" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
