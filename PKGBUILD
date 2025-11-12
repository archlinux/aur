# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>
pkgname=wifitui
pkgver=0.7.1
pkgrel=1
pkgdesc="Fast featureful friendly wifi terminal UI"
arch=("aarch64" "x86_64")
url="https://github.com/shazow/wifitui"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba9dcf1dffc76c573f2f9c5dc0965e3b29c2723fb9fc5e54c27592fd6b15eadb')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o $pkgname .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
