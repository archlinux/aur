pkgname=rest-server
pkgdesc='Rest Server is a high performance HTTP server that implements restics REST backend API (git version).'
license=('BSD')
url='https://github.com/restic/rest-server'
pkgver=0.10.0
pkgrel=1
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/restic/rest-server/archive/v${pkgver}.tar.gz")
sha256sums=('d109cf9e9c3f36c9c8eb6d4a2bd530c5dfcd62b11687d93034e2edc0fdecf479')
provides=('rest-server')
conflicts=('rest-server')

makedepends=('go-pie' 'git')

build() {
    cd ${pkgname}-${pkgver}
    CGO_ENABLED=0 go build -trimpath -ldflags "-extldflags ${LDFLAGS}" -o rest-server ./cmd/rest-server
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 rest-server "${pkgdir}/usr/bin/rest-server"
    install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

