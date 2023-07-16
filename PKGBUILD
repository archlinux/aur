# Maintainer: Drew Nutter <dnut@users.noreply.github.com>
# Contributor: Dmitri Goutnik <dg@syrec.org>

pkgname=pget
pkgver=0.1.1
pkgrel=1
pkgdesc="Fast, resumable, and parallel file download client, written in go."
arch=(i686 x86_64 i386 arm arm64 armv6 aarch64)
url="https://github.com/Code-Hex/${pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Code-Hex/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('34d674dc48144c84de72d525e67d96500243cc1d1c4c0433794495c0846c193f')

prepare() {
    mkdir -p "${srcdir}/src/github.com/Code-Hex/"
    mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/Code-Hex/${pkgname}"
}

build() {
    cd "${srcdir}/src/github.com/Code-Hex/${pkgname}"
    export GOPATH="${srcdir}"
    go get -d ./cmd/${pkgname}
    go build ./cmd/${pkgname}
}

package() {
    cd "${srcdir}/src/github.com/Code-Hex/${pkgname}"
    install -Dm755 pget "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
