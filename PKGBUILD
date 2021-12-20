pkgname=grasp
pkgver=0.2.0
pkgrel=1
pkgdesc='Create strong passwords using words that are easy for you to remember. A password manager that does not require any type of storage'
arch=('x86_64')
url="https://github.com/lucasepe/grasp"
makedepends=("go" "git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8362d582a233a701c1e639377ce90a3b27f931009bb88b630cdb7990faa07ceb')


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
