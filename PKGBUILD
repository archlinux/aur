# Maintainer: Chair050 <tmiggia at proton dot me>
pkgname=cook-framework
pkgver=2.2.1
pkgrel=1
pkgdesc='a wordlist generator, splitter, merger, finder, saver, creator'
arch=('x86_64' 'aarch64')
url='https://github.com/glitchedgitz/cook'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=('cook')
source=("cook-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('708f08171f4a46c4ddf95ac5f4c6fc4d')

build() {
	cd "cook-${pkgver}/v2/cmd/cook/"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build .
}

package() {
	cd "cook-${pkgver}"
	install -Dvm755 "./v2/cmd/cook/cook" -t "${pkgdir}/usr/bin"
	install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dvm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
