# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=proxyguard
pkgver=2.0.1
pkgrel=1
pkgdesc='Proxy WireGuard UDP connections over HTTP(S)'
arch=('x86_64')
license=('MIT')
url='https://codeberg.org/eduVPN/proxyguard'
source=("$url/archive/v$pkgver.tar.gz")
makedepends=('go')
options=(!lto)
sha256sums=('90f857ffcd19aacb4d87eef8126d78d8d8653a774de7a3aff2cb2bbc2b726407')

build() {
    pwd
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -v -o $pkgname .
}

package() {
    cd "$pkgname"
    install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGES.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.md"
}
