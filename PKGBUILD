# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=gox
pkgver=0.3.0
pkgrel=2
pkgdesc="A simple, no-frills tool for Go cross compilation"
arch=('i686' 'x86_64')
url='https://github.com/mitchellh/gox'
license=('MPL')
makedepends=('go' 'git')
source=("https://github.com/mitchellh/gox/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('29dc6b689f670a5444cc54cd9111549ccb01501901bc9197d0e1325a35157802')

prepare() {
	GOPATH="${srcdir}" go get github.com/mitchellh/iochan
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
