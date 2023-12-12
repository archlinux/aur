# Maintainer: Charlie Ringström <c.ringstrom@gmail.com>
pkgname='longcat'
pkgver='0.0.4'
pkgrel=14
pkgdesc="Creates a loooonng cat in the terminal"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mattn/longcat"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
#changelog="Initial release"
source=("longcat::git+https://github.com/mattn/longcat.git#tag=v$pkgver")
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
	printf $pkgver
	#go build -o longcat
}

package() {
	cd "$pkgname"
	install -Dm755 ./longcat "$pkgdir"/usr/bin/$pkgname
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
