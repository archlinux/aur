# Maintainer: Krystian <krystian@krystianch.com>
_gitname=speedtest_exporter
pkgname=prometheus-speedtest-exporter
pkgver=0.3.0
pkgrel=1
pkgdesc="This Prometheus exporter check your network connection"
arch=('any')
url="https://github.com/nlamirault/speedtest_exporter"
license=('Apache-2.0')
depends=('go')
makedepends=('glide')
checkdepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" "prometheus-speedtest-exporter.service")
md5sums=("3ba81a313be0feea5c4d6533e13ecd83" "ca9a701a088f1ada3c6a50e2d3250868")

prepare() {
    cd "$_gitname-$pkgver"
    sed -i 's/github\.com\/golang\/lint\/golint/golang\.org\/x\/lint/g' Makefile
}

build() {
    cd "$_gitname-$pkgver"
    make init
    make build
}

package() {
    install -Dm644 prometheus-speedtest-exporter.service "$pkgdir"/usr/lib/systemd/system/prometheus-speedtest-exporter.service
    cd $_gitname-$pkgver
    install -Dm755 $_gitname "$pkgdir"/usr/bin/$pkgname
}
