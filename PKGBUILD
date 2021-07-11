# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=xearth
pkgver=1.1
pkgrel=1
pkgdesc='Xearth sets the X root window to an image of the Earth'
url="https://xearth.org/"
license=('CUSTOM')
arch=('x86_64' 'aarch64')
makedepends=('libx11' 'libxt')
provides=(${pkgname})
source=("https://xearth.org/xearth-${pkgver}.tar.gz")
sha256sums=('bcb1407cc35b3f6dd3606b2c6072273b6a912cbd9ed1ae22fb2d26694541309c')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  sed '0,/^LEGAL STUFF$/d' README > LICENSE
  mv "${pkgname}.man" "${pkgname}.1"
  gzip "${pkgname}.1"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  make -f Makefile.DIST
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
