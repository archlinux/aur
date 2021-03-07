# Maintainer: Patryk Jeziorowski <patryk.jeziorowski@gmx.com>
pkgname=canal-cli
pkgver=0.0.3
pkgrel=1
pkgdesc="Canal Command Line Interface"
arch=(x86_64)
url="https://github.com/trycanal/cli"
license=('MIT')
makedepends=(git go)
source=("https://github.com/trycanal/cli/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o $pkgname main.go
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/canal"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('b6d6c75f9fe76e954efd98b46fcac167')
