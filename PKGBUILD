# Maintainer: Per Osbeck <per@osbeck.com>
_pkgname=globalping
pkgname=$_pkgname-cli
pkgver=1.6.0 # renovate: datasource=github-releases depName=jsdelivr/globalping-cli
pkgrel=1
pkgdesc="Better understand your network routing, fix anycast issues, monitor your CDN and DNS performance, do uptime monitoring and build your own network tools for personal or public use."
arch=(x86_64)
url="https://github.com/jsdelivr/globalping-cli"
license=('MPL-2.0')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/jsdelivr/$pkgname.git#tag=v$pkgver")
sha256sums=('492ade328f0df5bbd02e0ec4fc308c442ac03e0a79cd9b1e9496063c6564ad5c')
conflicts=("$_pkgname" "$_pkgname-bin")

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

# CI path-filter nudge for AUR action smoke test
