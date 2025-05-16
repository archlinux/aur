# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=scotty
pkgver=0.5.2
pkgrel=1
pkgdesc="Transfer listens and loves between music services"
arch=('x86_64')
url="https://git.sr.ht/~phw/scotty"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v${pkgver}")
sha256sums=('efdec43a6e69136f8ac03db840c9ec109b64cc9cf7710ee3f1606d56be5dc3b7')

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
