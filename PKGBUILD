# Maintainer: Nurio Fernandez <nuriofernandez@gmail.com>
pkgname=movistarcli
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial CLI for managing your Movistar HGU router from the terminal"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/nuriofernandez/movistarcli"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nuriofernandez/movistarcli/archive/v${pkgver}.tar.gz")
sha256sums=('93eaf1d86fe3a67de2320dda660720cc42f19012b0b6f9be2619de0600e49fa1')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    export GOFLAGS="-mod=readonly"
    go build -trimpath -ldflags="-s -w" -o movistarcli .
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/movistarcli" "${pkgdir}/usr/bin/movistarcli"
}
