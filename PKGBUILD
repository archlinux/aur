# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=go-bindata
pkgver=3.5.1
pkgrel=1
pkgdesc="A small utility which generates Go code from any file"
arch=('x86_64')
url='https://github.com/shuLhan/go-bindata'
license=('CC0 1.0')
depends=('glibc')
makedepends=('go-pie')
source=("https://github.com/shuLhan/go-bindata/archive/v${pkgver}.tar.gz")
sha512sums=('19cf44d8e7d67dcc2ed470e39cb1464351f91927133500604166e0b0981799f7cc5ba10c122761174ae101901a729a5d56bd0ae4d678eb846550a61624c502d4')

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
