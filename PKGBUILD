# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ncmdump 
pkgver=1.7.1
pkgrel=1
pkgdesc="Convert Netease Cloud Music ncm files to mp3/flac files."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://git.taurusxin.com/taurusxin/ncmdump-go"
license=("Unknown")
makedepends=("go")
provides=("${pkgname}"{,-latest-bin})
conflicts=("${pkgname}"{,-latest-bin})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b35a9ef02379baef3fd9d1f466aed6ebcef3b50989f807b2a3e492fff018a14b')

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
