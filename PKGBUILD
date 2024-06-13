# Maintainer: devome <evinedeng@hotmail.com>

pkgname="taierspeed-cli"
pkgver=1.7.1
pkgrel=1
pkgdesc="TaierSpeed CLI"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/ztelliot/${pkgname}"
provides=("${pkgname}" "${pkgname%-*}")
conflicts=("${pkgname}" "${pkgname%-*}")
license=("LGPL-3.0-or-later")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6eb2bb51f5b609bc3a4a10ca44d6be4b20dfcde39b324811bff6a1f6d1f643af')

build() {
    cd "${pkgname}-${pkgver}"
    local ldflags="
        -w -s \
        -X \"${url/https:\/\//}/defs.ProgName=${pkgname}\" \
        -X \"${url/https:\/\//}/defs.ProgVersion=${pkgver}\" \
        -X \"${url/https:\/\//}/defs.BuildDate=$(date -u "+%Y-%m-%d %H:%M:%S %Z")\"
    "
    go build -o "${pkgname}" -ldflags "${ldflags}" -trimpath main.go
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    ln -s          "${pkgname}" "${pkgdir}/usr/bin/${pkgname%-*}"
}
