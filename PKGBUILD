# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=revive
pkgver=1.0.2
pkgrel=1
pkgdesc="~6x faster, stricter, configurable, extensible, and beautiful drop-in replacement for golint"
arch=('x86_64')
url='https://revive.run'
license=('MIT')
makedepends=('go')
source=("https://github.com/mgechev/revive/archive/v${pkgver}.tar.gz")
md5sums=('74c29ec1f0af873dcde0d0bc495ac0cf')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build
	export GOPATH="${srcdir}/go" 
	PATH="${srcdir}/go/bin:${PATH}"
	go build -v -o build/revive
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "build/revive" "${pkgdir}/usr/bin/revive"
	install -Dm644 "defaults.toml" "${pkgdir}/etc/revive/revive.toml"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	go clean -modcache # clean modcache
}