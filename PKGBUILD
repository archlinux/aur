# Maintainer: James Reed <james at twiddlingbits dot net>

pkgname=cheatsheet
pkgver=0.1.0
pkgrel=1
pkgdesc="A command-line cheatsheet for the command-line"
arch=('x86_64')
url="https://github.com/atlasamerican/cheatsheet"
license=('MIT')
depends=('git')
makedepends=('go')
install=cheatsheet.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('1f2268485de0f918ee40776db693f979')

build() {
    cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make
}

package() {
    cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
