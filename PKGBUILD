# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=see-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Command-line client for the S.EE content sharing platform"
arch=('x86_64')
url="https://github.com/sdotee/cli"
license=('MIT')
makedepends=('go')
conflicts=('see-cli' 'see-cli-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sdotee/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('42685723422664ed923db28fd1437809011f860358dd5e3aaa28fd9bd461721d')
options=('!lto')

build() {
    cd "cli-${pkgver}"
    export CGO_ENABLED=0
    go build -trimpath -ldflags="-s -w -X main.BuildVersion=${pkgver}" -o see .
}

package() {
    cd "cli-${pkgver}"
    install -Dm755 see "${pkgdir}/usr/bin/see"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

