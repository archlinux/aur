# Maintainer: Santiago Torres-Arias <santiago at archlinux dot org>

pkgname=draft
pkgver=0.16.0
_language='en-US'
pkgrel=1
pkgdesc="A tool for developers to create cloud-native applications on Kubernetes."
arch=('x86_64')
url="https://draft.sh"
license=('MIT')
depends=('glibc')
makedepends=('go' 'dep')

source_x86_64=("git+https://github.com/azure/draft?tag=v0.16.0")
# source+=()
sha512sums_x86_64=('SKIP')
#validpgpkeys=('')

build() {
    export GOPATH="${srcdir}/"
    mkdir -vp "src/github.com/Azure" && mv "${pkgname}" "src/github.com/Azure"

    cd "src/github.com/Azure/${pkgname}"

	go get -u github.com/alecthomas/gometalinter
    go get github.com/jteeuwen/go-bindata
    dep ensure -v

    go build ./cmd/...
}

package() {
    cd "src/github.com/Azure/${pkgname}"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
