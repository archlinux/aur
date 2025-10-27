# Maintainer: Per Osbeck <per@osbeck.com>
pkgname=globalping-cli
pkgver=1.5.1 # renovate: datasource=github-releases depName=jsdelivr/globalping-cli
pkgrel=1
pkgdesc="Better understand your network routing, fix anycast issues, monitor your CDN and DNS performance, do uptime monitoring and build your own network tools for personal or public use."
arch=(x86_64)
url="https://github.com/jsdelivr/globalping-cli"
license=('MPL-2.0')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/jsdelivr/$pkgname.git#tag=v$pkgver")
sha256sums=('cd6a9e077848a09bfa3a3c4b6a2f6fa9a1dff7121c5eeacd86750a9976a7267b')
conflicts=("$pkgname" "${pkgname}-cli")

build() {
	cd "$pkgname"
    go mod tidy
	CGO_ENABLED=0 go build -v
	go clean -modcache
}

package() {
	install -Dm644 ${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/globalping"
}
