# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=go-bindata
pkgver=3.3.0
pkgrel=1
pkgdesc="A small utility which generates Go code from any file"
arch=('x86_64')
url='https://github.com/shuLhan/go-bindata'
license=('CC0 1.0')
depends=('glibc')
makedepends=('go-pie')
source=("https://github.com/shuLhan/go-bindata/archive/v${pkgver}.tar.gz")
sha512sums=('27d85b8c90fa984f7aaee8099976d1c9394c76b39fe54a7aef34b65dd9a70f7d062749dea49aff36785ee0663331cee8f29d88bea4be030f1c3ef9d280df0530')

prepare() {
    mkdir -p "${srcdir}/src/github.com/shuLhan/"
    mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/shuLhan/go-bindata"
}

build() {
    cd "${srcdir}/src/github.com/shuLhan/go-bindata/go-bindata"
    GOPATH="${srcdir}" go build
}

package() {
    cd "${srcdir}/src/github.com/shuLhan/go-bindata"
    install -Dm755 "go-bindata/go-bindata" "${pkgdir}/usr/bin/go-bindata"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
