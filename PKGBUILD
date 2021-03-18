# Maintainer: Pieter Joost van de Sande <pj@born2code.net>
pkgname=xrandr-notify
pkgver=0.2.0
pkgrel=1
arch=('any')
pkgdesc='subscribe to randr xevents'
url='https://github.com/pjvds/xrandr-notify'
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha1sums=('8437af917b8e7a3dc8f55860cbb074340e0dbe23')

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
