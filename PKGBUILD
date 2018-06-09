# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=go-bindata
pkgver=3.4.0
pkgrel=1
pkgdesc="A small utility which generates Go code from any file"
arch=('x86_64')
url='https://github.com/shuLhan/go-bindata'
license=('CC0 1.0')
depends=('glibc')
makedepends=('go-pie')
source=("https://github.com/shuLhan/go-bindata/archive/v${pkgver}.tar.gz")
sha512sums=('1d1d0a0f3e4865d0b7c4b61c6ed0570800948054c620c4a2f4c6ad03614b69fb931ef19697193717dd3109922962684314ce81102e2a0e325c3ce904a7bd230c')

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
