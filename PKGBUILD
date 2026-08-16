# Maintainer: normen <normen@users.noreply.github.com>
pkgname=whatscli
pkgver=1.1.6
pkgrel=1
pkgdesc='A command line interface for WhatsApp, based on go-whatsmeow and tview'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/normen/whatscli'
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/normen/whatscli/archive/v${pkgver}.tar.gz")
sha1sums=('a32108fbda9c056143b686b3b1662db5b5c5feaf')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o "${pkgname}" -ldflags "-s -w -X main.VERSION=v${pkgver}" .
}

package() {
    install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
