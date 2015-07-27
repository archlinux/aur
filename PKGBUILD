# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=gox
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple, no-frills tool for Go cross compilation"
arch=('i686' 'x86_64')
url='github.com/mitchellh/gox'
license=('MPL 2.0')
depends=('glibc')
makedepends=('go')
source=("https://github.com/mitchellh/gox/archive/v${pkgver}.tar.gz")
sha512sums=('cbc737a780403d1233af10a85b30676e0fcfbfbe99a740d0eff69bef4fd557c65d102c43b3b0dde0b8b935967be8cb33fab50d2baf481d27fa53285be6b1aef2')

prepare() {
	export GOPATH="${srcdir}"
    go get github.com/mitchellh/iochan
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    GOPATH="${srcdir}" go build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/gox"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
