# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=go-bindata
pkgver=3.5.0
pkgrel=1
pkgdesc="A small utility which generates Go code from any file"
arch=('x86_64')
url='https://github.com/shuLhan/go-bindata'
license=('CC0 1.0')
depends=('glibc')
makedepends=('go-pie')
source=("https://github.com/shuLhan/go-bindata/archive/v${pkgver}.tar.gz")
sha512sums=('4f7f35a12ed98ede5e7967db0584b42aa3f7c9ce59459e710023827bd7cfea1be34b617606789b23c2fa87e88628bc4f2545d288944c313475ee7e08016702c7')

prepare() {
    mkdir -p "${srcdir}/src/github.com/shuLhan/"
    mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/shuLhan/go-bindata"
}

build() {
    cd "${srcdir}/src/github.com/shuLhan/go-bindata/cmd/go-bindata"
    GOPATH="${srcdir}" go build
}

package() {
    cd "${srcdir}/src/github.com/shuLhan/go-bindata/cmd/go-bindata"
    install -Dm755 "go-bindata" "${pkgdir}/usr/bin/go-bindata"
    install -Dm644 ../../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
