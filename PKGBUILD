# Maintainer: Kamil Krzysztof Kulach <kamilk1512@gmail.com>
pkgname=meme-lord-picker
pkgver=0.2.0
pkgrel=1
pkgdesc="Quick image/gif picker for MemeLord"
arch=('x86_64')
url="https://github.com/Kam1ni/meme-lord-picker"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'wl-clipboard')
makedepends=('go' 'git')
source=("git+https://github.com/Kam1ni/meme-lord-picker.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$srcdir/meme-lord-picker/src"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -v -o "$pkgname" .
}

package() {
	cd "$srcdir/meme-lord-picker"
	install -Dm755 "src/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "assets/meme-lord-picker.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "assets/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
