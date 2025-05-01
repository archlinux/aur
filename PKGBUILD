# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

_gitname=clamav-prometheus-exporter
pkgname=prometheus-clamav-exporter
pkgdesc="Prometheus-Exporter for ClamAV"
pkgver=1.0.0
pkgrel=2
arch=("any")
url="https://github.com/r3kzi/clamav-prometheus-exporter"
license=('Apache')
makedepends=('git' 'go')
source=("https://github.com/r3kzi/clamav-prometheus-exporter/archive/refs/tags/v${pkgver}.tar.gz"
        "prometheus-clamav-exporter.service")
sha256sums=('2fff7b23dd5f96021f7cbd120edc9b1354c37ac7667b5073a93c86ab739d7715'
        '1ce1a94c1596ad0035eb2f4977015ce8c7e662eff7cf7b7d49eb69b2ebb35a5b')

build(){
    cd "${srcdir}/${_gitname}-${pkgver}/"

        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CXXFLAGS="${CXXFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS}"
        export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

        go build -o prometheus-clamav-exporter .
}

package () {
    cd "${srcdir}/"

        install -Dm 755 "${_gitname}-${pkgver}/prometheus-clamav-exporter" "${pkgdir}/usr/bin/prometheus-clamav-exporter"
        install -Dm 644 ./prometheus-clamav-exporter.service "${pkgdir}/usr/lib/systemd/system/prometheus-clamav-exporter.service"

}
