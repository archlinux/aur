# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=go-bindata
pkgver=3.5.2
pkgrel=1
pkgdesc="A small utility which generates Go code from any file"
arch=('x86_64')
url='https://github.com/shuLhan/go-bindata'
license=('CC0 1.0')
depends=('glibc')
makedepends=('go-pie')
source=("https://github.com/shuLhan/go-bindata/archive/v${pkgver}.tar.gz")
sha512sums=('2e9a807445ed6ddfd681f6886503c116c8ceba6572f5a8b2cdbf78c585a476b5dfb0dc967b62f1510caef8e1e09db39043362e252da773272a79a7b257c9d275')

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
