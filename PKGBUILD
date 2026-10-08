# Maintainer: Per Osbeck <per@osbeck.com>
_pkgname=globalping
pkgname=$_pkgname-cli
pkgver=1.6.1 # renovate: datasource=github-releases depName=jsdelivr/globalping-cli
pkgrel=1
pkgdesc="Better understand your network routing, fix anycast issues, monitor your CDN and DNS performance, do uptime monitoring and build your own network tools for personal or public use."
arch=(x86_64)
url="https://github.com/jsdelivr/globalping-cli"
license=('MPL-2.0')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/jsdelivr/$pkgname.git#tag=v$pkgver")
sha256sums=('80adf6b5e2c21527f5d5622d4be6e071668376d8e7f943b24ac39cb5ef2aff48')
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
