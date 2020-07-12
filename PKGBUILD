# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=round
pkgver=0.0.2
pkgrel=1
pkgdesc='A command-line for rounding the images'
arch=(x86_64)
url='https://github.com/mingrammer/round'
license=(MIT)
depends=(glibc)
makedepends=(go git)
source=(git+"${url}".git#tag=v"${pkgver}")
md5sums=(SKIP)

build() {
	cd "${pkgname}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build .
}

package() {
	cd "${pkgname}"
	install -Dm755 $pkgname -t "$pkgdir"/usr/bin
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
