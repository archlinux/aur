# Maintainer: unknowndev <unknowndev at archlinux.info>

pkgname=v2ray-exporter
pkgver=0.4.0
pkgrel=2
pkgdesc="An exporter that collect V2Ray metrics over its Stats API and export them to Prometheus"
arch=('x86_64')
url="https://github.com/wi1dcard/v2ray-exporter"
license=('MIT')
depends=('glibc')
optdepends=('v2ray: provide v2ray status')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('4784a869cc63998c2c0fcc0df9d6c826c6b94eee2ba9f58e5c79655a6eb9ce23e439c31855fae0b06a84151b454fe639cc3a6d3f3f2e7d229b4b09485a33fa2f')


build() {
    cd "${pkgname}-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GO111MODULE=on
    export CGO_ENABLED=0 # build full static binary
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build -o v2ray-exporter ./...

}

__check() {
    cd "${pkgname}-${pkgver}"
    echo Unable to test at this time
#    go test -v --cover ./...
}

package() {
    cd "${pkgname}-${pkgver}"
#    sed -i '7 s/#Type=exec/Type=exec/'              "v2ray-exporter.service"
#    sed -i '8 s/Type=simple/#Type=simple/'          "v2ray-exporter.service"
#    install -Dm644 "v2ray-exporter.service" -t      "$pkgdir/usr/lib/systemd/system"
#    install -Dm644 "v2ray-exporter@.service" -t     "$pkgdir/usr/lib/systemd/system"
    install -Dm755 "v2ray-exporter" -t              "${pkgdir}/usr/bin"
}

