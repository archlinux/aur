# Maintainer: knightshrub <elia@dl1ye.de>
pkgname=hamirc
pkgver=0.0.2
pkgrel=1
epoch=
pkgdesc='Minimal IRC server that can send and receive messages via a KISS TNC'
arch=('x86_64')
url="https://github.com/sparques/${pkgname}"
license=('GPL-3.0-only')
groups=()
depends=('glibc')
makedepends=('git' 'go')
checkdepends=()
optdepends=('direwolf: Software KISS TNC')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+${url}#tag=v${pkgver}")
noextract=()
sha256sums=('d18b9076e86a6a51866145227d64966af3cb21bdf294a8fbbb6f879f67c8e697')
validpgpkeys=()

prepare() {
    cd "$srcdir/${pkgname}"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "$srcdir/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build
}

package() {
    cd "$srcdir/${pkgname}"
    install -Dm755 $pkgname "${pkgdir}/usr/bin/$pkgname"
}
