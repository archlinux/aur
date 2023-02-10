# Maintainer: Albert Koczy <alufers@wp.pl>

pkgname=inpost-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="A CLI tool to interact with the Polish InPost postal company."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/alufers/${pkgname}"
license=('MIT')
makedepends=('go')
_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::https://github.com/alufers/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('d75e47425eb14453e65e7ff50078c90b80e66f36e12212b44ebbc66a28b52a7ee8577ceb09846ba9656ea140505d66bb15519ed7ab3075857a7f26858d48cebb')

build() {
    set -a
    CGO_CPPFLAGS="${CPPFLAGS}"
    CGO_CFLAGS="${CFLAGS}"
    CGO_CXXFLAGS="${CXXFLAGS}"
    CGO_LDFLAGS="${LDFLAGS}"
    GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    set +a

    cd "${_snapshot}"
    go build -o "${srcdir}/build/" "./"
}

package() {
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    cd "${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.md"
}
