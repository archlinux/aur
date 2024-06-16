# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=k8sgpt
pkgver=0.3.35
pkgrel=1
pkgdesc='A tool for scanning your Kubernetes clusters, diagnosing, and triaging issues in simple English.'
arch=('x86_64' 'arm64' 'i386')
url='https://k8sgpt.ai/'
license=('Apache-2.0')
provides=('k8sgpt')
conflicts=('k8sgpt')
makedepends=('go')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/k8sgpt-ai/k8sgpt/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
    '1f35e61e60f35a1ddcb3a806f93fa2e0465599a508d080326c59e394186cb1d8'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build -o "bin/${pkgname}" \
        -ldflags "-s -w -X main.version=${pkgver} -X main.date=$(date +%FT%TZ)" \
        ./main.go
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go test ./...
}

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
}
