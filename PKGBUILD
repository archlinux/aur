# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=cbp2make
pkgver=156
pkgrel=1
pkgdesc='Makefile generation tool for Code::Blocks IDE'
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/${pkgname}/"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://master.dl.sourceforge.net/project/${pkgname}/${pkgname}-stl-rev${pkgver}.tar.gz"
	"${pkgname}.1")
sha256sums=('790d4a19f875dc49ce0329e0a1cb2991adfca41c6091bff32aea714a576f4e1e'
            '79c64b285a8f5c138f51d3b63c25debe7d53f5ff98724e0ebf04e7e152c936df')

prepare() {
  	gzip --keep "${startdir}/${pkgname}.1"
	cd "${pkgname}-stl-rev${pkgver}"
}

build() {
	cd "${pkgname}-stl-rev${pkgver}"
	make release -f cbp2make.cbp.mak.unix
}

package() {
	cd "${pkgname}-stl-rev${pkgver}"
	install -Dm755 "bin/Release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${startdir}/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
