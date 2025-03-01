# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=nali-nt
pkgname=${_pkgname}-git
pkgver=1.7.5.r0.g1c7d35e
pkgrel=2
pkgdesc="集成了 NextTrace LEOMOEAPI 的 nali; 一个查询 IP 地理信息和 CDN 服务提供商的离线终端工具. An offline tool for querying IP geographic information and CDN provider. (git package)"
arch=(
    "x86_64"
    "i686"
    "aarch64"
    "armv6h"
    "armv7h"
    "mips"
    "mipsel"
    "mips64"
    "mips64el"
    "mipsel"
    "ppc64"
    "ppc64le"
    "riscv64"
    "s390x"
)
makedepends=("go" "git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://nxtrace.github.io/nali/"
license=("MIT")

source=("git+https://github.com/nxtrace/nali.git")

sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/nali"
    git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/nali"
    go build
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/nali/nali" "${pkgdir}/usr/bin/nali-nt"
}
