# Maintainer: Edward Wibowo <wibow9770@gmail.com>
pkgname=make-tui
pkgver=0.2.0
pkgrel=1
pkgdesc='Display and run Makefile rules in the terminal.'
arch=('x86_64')
url='https://github.com/claby2/make-tui'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    CGO_ENABLED=0

    go build \
        -gcflags "all=-trimpath=${PWD}" \
        -asmflags "all=-trimpath=${PWD}" \
        -ldflags "-X main.Version=v${pkgver} -extldflags ${LDFLAGS}" \
        -buildmode=pie \
        ./
}

package() {
    install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/bin/licenses/${pkgname}/LICENSE"
}
