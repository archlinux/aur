pkgname=trojan-go-git
_pkgname=trojan-go
pkgver=0.4.10.r0.ga661696
pkgrel=1
pkgdesc="A Trojan proxy written in Go (git version)."
arch=(x86_64)
url="https://github.com/p4gefau1t/trojan-go"
license=(GPL3)
depends=(glibc)
makedepends=(go git)
provides=(trojan-go)
conflicts=(trojan-go)
optdepends=(
	'v2ray-domain-list-community: geosite'
	'v2ray-geoip: geoip'
)
source=("$_pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"/$_pkgname
    CGO_ENABLE=0 go build -tags "full" -ldflags="-s -w" -o trojan-go .
}

package() {
    cd "$srcdir"/$_pkgname
    install -Dm755 "$srcdir"/$_pkgname/trojan-go -t "$pkgdir"/usr/bin/trojan-go/
    ln -sf /usr/lib/v2ray/geosite.dat "$pkgdir"/usr/bin/trojan-go/geosite.dat
    ln -sf /usr/lib/v2ray/geoip.dat "$pkgdir"/usr/bin/trojan-go/geoip.dat
}
