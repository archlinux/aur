# Maintainer: Drew Nutter <dnut@users.noreply.github.com>
# Contributor: Dmitri Goutnik <dg@syrec.org>

pkgname=pget
pkgver=0.2.1
pkgrel=1
pkgdesc="Fast, resumable, and parallel file download client, written in go."
arch=(i686 x86_64 i386 arm arm64 armv6 aarch64)
url="https://github.com/Code-Hex/${pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Code-Hex/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(fa7646bec975dd3995fb45d6b1f190565d6c4fae03c46c4eda34716c83ede03e)

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
