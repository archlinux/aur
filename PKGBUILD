# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=wg-bench
pkgname=${_pkgname}-git
pkgver=r154.e286e4e
pkgrel=1
pkgdesc="WireGuard Benchmark using netns and iperf3"
arch=("any")
depends=(wireguard-tools iperf3 iproute2)
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://github.com/cyyself/wg-bench"
# license=("")

source=(
    "git+https://github.com/cyyself/wg-bench.git"
    wg-bench.sh
)
sha256sums=(
    "SKIP"
    "62d932911e4c6ccde16bc3f2b4fe1c1b4a0c98365c4f6a7b46fb06699099ab99"
)

pkgver() {
    cd "${srcdir}/wg-bench"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${srcdir}/wg-bench.sh" "${pkgdir}/usr/bin/wg-bench"
    install -Dm755 "${srcdir}/wg-bench/setup-netns.sh" "${pkgdir}/opt/wg-bench/setup-netns.sh"
    install -Dm755 "${srcdir}/wg-bench/benchmark.sh" "${pkgdir}/opt/wg-bench/benchmark.sh"
    install -Dm755 "${srcdir}/wg-bench/clean-up.sh" "${pkgdir}/opt/wg-bench/clean-up.sh"
    install -Dm755 "${srcdir}/wg-bench/config.sh" "${pkgdir}/opt/wg-bench/config.sh"
}
