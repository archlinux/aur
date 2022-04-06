# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=moar
pkgver=1.9.1
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(any)
url='https://github.com/walles/moar'
license=(BSD)
makedepends=(go)
optdepends=(highlight)
checkdepends=(highlight)
source=("https://github.com/walles/moar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('478eb7bc7af01c5c99f0105e20e2dfe998f2f8f6b5c5e1db21da0ff472be0356')

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
