# Maintainer: unknowndev <unknowndev at archlinux.info>

pkgname=v2ray-exporter
pkgver=0.3.0
pkgrel=1
pkgdesc="An exporter that collect V2Ray metrics over its Stats API and export them to Prometheus"
arch=('x86_64')
url="https://github.com/wi1dcard/v2ray-exporter"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('bc3f759afb72d7d268a4f9001fa2f3a3a3f312ee27f3e9de72133cfe3b5c2a7f14df8776935ecc10d6dd5dd012c80f70e715fa96c7a59a33514e0e258021dd46')



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
