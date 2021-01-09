# Maintainer: Charlie Ringström <c.ringstrom@gmail.com>
pkgname='longcat'
pkgver=r113.f0ff33e
pkgrel=1
pkgdesc="Creates a loooonng cat in the terminal"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mattn/longcat"
license=('MIT')
depends=('glibc')
makedepends=('go')
#changelog="Initial release"
source=("longcat::git://github.com/mattn/longcat.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
