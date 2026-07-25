# Maintainer: Kamil Krzysztof Kulach <kamilk1512@gmail.com>
pkgname=tuxpit-kneeboard
pkgver=1.1.0
pkgrel=1
pkgdesc="Kneeboard overlay for Digital Combat Simulator made with golang and qt6."
arch=('x86_64')
url="https://github.com/Kam1ni/tuxpit-kneeboard"
license=('MIT')
depends=('qt6-base' 'ttf-nerd-fonts-symbols')
makedepends=('go' 'git' 'pkgconf')
optdepends=('ttf-dejavu: fallback font if no system font available')
source=("git+https://github.com/Kam1ni/tuxpit-kneeboard.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$srcdir/tuxpit-kneeboard/src"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -v -o "$pkgname" .
}

package() {
	cd "$srcdir/tuxpit-kneeboard"
	install -Dm755 "src/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "assets/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "assets/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

