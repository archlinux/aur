# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=scotty
pkgver=0.4.1
pkgrel=1
pkgdesc="Transfer listens and loves between music services"
arch=('x86_64')
url="https://git.sr.ht/~phw/scotty"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
source=("git+$url#tag=v${pkgver}")
sha256sums=('b5d9378012eb086ae2a118062d5884f42c7c6afa674802dfea29d35e75759f9c')

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname/config.example.toml" "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
	install -Dm644 "$srcdir/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
