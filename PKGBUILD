# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
pkgname=ghz
pkgver=0.55.0
pkgrel=1
pkgdesc="Simple gRPC benchmarking and load testing tool"
arch=('x86_64')
url="https://ghz.sh/"
license=('Apache')
makedepends=('go')
source=("https://github.com/bojand/ghz/archive/v$pkgver.tar.gz")
sha256sums=('d968e7841ec5c06bed2ab297308defa8ff268acd1ecdc7c003aebfc593f29d5d')

prepare() {
	mkdir -p build
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS} -s -w"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -v -o $srcdir/build ./cmd/...
	#make build
}

package() {
	install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm755 build/$pkgname-web "$pkgdir"/usr/bin/$pkgname-web
}
