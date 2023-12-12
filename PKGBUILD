# Maintainer: Charlie Ringström <c.ringstrom@gmail.com>
pkgname='longcat'
pkgver=v0.0.4
pkgrel=2
pkgdesc="Creates a looooong cat in the terminal"
arch=('any')
url="https://github.com/mattn/longcat"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
#changelog="Initial release"
source=("longcat::git+https://github.com/mattn/longcat.git#tag=$pkgver")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags
}

build() {
	cd "$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o longcat
}

package() {
	cd "$pkgname"
	install -Dm755 ./longcat "$pkgdir"/usr/bin/$pkgname
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
