# Maintainer: Per Osbeck <per@osbeck.com>
pkgname=globalping-cli
pkgver=1.5.0 # renovate: datasource=github-releases depName=jsdelivr/globalping-cli
pkgrel=1
pkgdesc="Better understand your network routing, fix anycast issues, monitor your CDN and DNS performance, do uptime monitoring and build your own network tools for personal or public use."
arch=(x86_64)
url="https://github.com/jsdelivr/globalping-cli"
license=('MPL-2.0')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/jsdelivr/$pkgname.git#tag=v$pkgver")
sha256sums=('f3c756d8e414a7d30538f38db5a5d74f61b90fa4688b4fd24523fafc259a5c14')
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
