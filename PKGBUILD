# Maintainer: Vinay Shastry <vinayshastry at gmail dot com>

pkgname=wormhole-william
pkgver=1.0.3
pkgrel=1
pkgdesc='A go (golang) implementation of magic wormhole. It provides secure end-to-end encrypted file transfers between computers. It is compatible with the official python magic wormhole cli tool (see magic-wormhole package).'
arch=('x86_64')
url="https://github.com/psanford/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go-pie' 'git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('23025d39314a3f4a848b1a1093dc66c81c5173e8aac263009bd2bcf8e1644953')

build() {
    cd "${pkgname}-${pkgver}"
    go build \
       -ldflags "-extldflags ${LDFLAGS}" \
       -gcflags "all=-trimpath=${PWD}" \
       -asmflags "all=-trimpath=${PWD}" \
       -o "${pkgname}" .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
