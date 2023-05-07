# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=moar
pkgver=1.14.0
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(any)
url='https://github.com/walles/moar'
license=(BSD)
makedepends=(go)
optdepends=(highlight)
checkdepends=(highlight)
source=("https://github.com/walles/moar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('93287d8b7fc287b6cbc1c2e830a3df618ec31e17dc6eaf5ea5fb72d75e3bc7e8')

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
