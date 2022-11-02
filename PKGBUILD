# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=moar
pkgver=1.10.0
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(any)
url='https://github.com/walles/moar'
license=(BSD)
makedepends=(go)
optdepends=(highlight)
checkdepends=(highlight)
source=("https://github.com/walles/moar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('72d3b7cb128c4eee732a299d85c518b48f7e8b8d4a8da875f80e99002f5488c9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	go build -ldflags="-X main.versionString=${pkgver}" -o "${pkgname}"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	go test github.com/walles/moar/m
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	
	install -dm755 "${pkgdir}/usr/bin"
	install -m755 "moar" "${pkgdir}/usr/bin/moar"
}
