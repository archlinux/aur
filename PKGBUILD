# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ncmdump 
pkgver=1.5.0
pkgrel=1
pkgdesc="Convert Netease Cloud Music ncm files to mp3/flac files."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://git.taurusxin.com/taurusxin/ncmdump-go"
license=("Unknown")
makedepends=("go")
provides=("${pkgname}"{,-latest-bin})
conflicts=("${pkgname}"{,-latest-bin})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('efa0b7db9cf8e357cbd03f2594f7f95c7b31dfc2417b5866c6cae45843dbbf7e')

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "ncmdump-go"
    go build -o "${pkgname}"
}

package() {
    cd "ncmdump-go"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
