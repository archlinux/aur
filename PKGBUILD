# Maintainer: Pieter Joost van de Sande <pj@born2code.net>
pkgname=randr-notify
pkgver=0.1.0
pkgrel=1
pkgdesc='subscribe to randr xevents'
arch=('1686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/pjvds/randr-notify'
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pjvds/randr-notify/archive/${pkgver}.tar.gz")
sha1sums=('6ab96e2deda52aa86b6d6f946a46f9f2ef0ba03e')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o ${pkgname} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" main.go
}

package() {
    install -Dm755 "${pkgname}-${pkgver}/${pkgname}" ${pkgdir}/usr/bin/${pkgname}
}
