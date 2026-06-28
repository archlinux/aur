# Maintainer: Wasylq <wasylq@protonmail.com>
pkgname=msd
pkgver=0.1.0
pkgrel=1
pkgdesc='Multi Site Downloader - download albums from file-hosting sites'
arch=('x86_64' 'aarch64')
url='https://github.com/Wasylq/MSD'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a1ec8a92811e3bc9c8680ddc94d82acdac4a9e147f4a46ad6ebd0cfd5120cec5')

build() {
    cd "MSD-${pkgver}"
    export CGO_ENABLED=0
    go build \
        -ldflags "-s -w -X main.version=v${pkgver} -X main.commit=aur -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        -o "${pkgname}" ./cmd/msd/
}

package() {
    cd "MSD-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
