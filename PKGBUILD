# Maintainer: Vinay Shastry <vinayshastry at gmail dot com>

pkgname=wormhole-william
pkgver=1.0.5
pkgrel=1
pkgdesc='A go (golang) implementation of magic wormhole. It provides secure end-to-end encrypted file transfers between computers. It is compatible with the official python magic wormhole cli tool (see magic-wormhole package).'
arch=('x86_64')
url="https://github.com/psanford/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a3e522a200168876e5762fb9aedd72724218cf0339b7024c30cd132e95d67d55')

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
