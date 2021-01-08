pkgname=grasp
pkgver=0.1.1
pkgrel=1
pkgdesc='Create strong passwords using words that are easy for you to remember. A password manager that does not require any type of storage'
arch=('x86_64')
url="https://github.com/lucasepe/grasp"
makedepends=("go" "git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('23cb977b5ee435c9a0540976c6fa82e9c282cf6dca0a37fc99303a88a83cd332')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

		go get ./...
    go build -o ${pkgname} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" .
}

package() {
    install -Dm755 "${pkgname}-${pkgver}/${pkgname}" ${pkgdir}/usr/bin/${pkgname}
}
