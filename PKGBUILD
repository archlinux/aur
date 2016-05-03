# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=go-bindata
pkgver=3.0.7
pkgrel=1
pkgdesc="A small utility which generates Go code from any file"
arch=('i686' 'x86_64')
url='https://github.com/jteeuwen/go-bindata'
license=('CC0 1.0')
depends=('glibc')
makedepends=('go')
source=("https://github.com/jteeuwen/go-bindata/archive/v${pkgver}.tar.gz")
sha512sums=('c1589061aaaee18b6a105977cc191678b74a4d005e8450db01ae37105a925766994a97531f15b2c7b22820da81bd5f6e28107efdaa759700abe1327e2144b6bc')

prepare() {
    mkdir -p "${srcdir}/src/github.com/jteeuwen/"
    mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/jteeuwen/go-bindata"
}

build() {
    cd "${srcdir}/src/github.com/jteeuwen/go-bindata/go-bindata"
    GOPATH="${srcdir}" go build
}

package() {
    cd "${srcdir}/src/github.com/jteeuwen/go-bindata"
    install -Dm755 "go-bindata/go-bindata" "${pkgdir}/usr/bin/go-bindata"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
