# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=cbp2make
pkgver=147
pkgrel=2
pkgdesc='Makefile generation tool for Code::Blocks IDE'
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/${pkgname}/"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://master.dl.sourceforge.net/project/${pkgname}/${pkgname}-stl-rev${pkgver}.tar.gz"
	"${pkgname}.1")
sha256sums=('002708b94556cf0b2b8c18e485148d01720e36c42229a40641f15f0c3f21c1e9'
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
	install -Dm644 "bin/Release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${startdir}/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
