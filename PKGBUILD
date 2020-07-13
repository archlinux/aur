# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=parpar-bin
_pkgname=parpar
pkgver=0.3.2
pkgrel=1
pkgdesc='A high-performance, multithreaded PAR2 creation tool'
arch=('x86_64')
url='https://github.com/animetosho/ParPar'
license=('Public Domain')
depends=('nodejs')
makedepends=(
	'npm'
	'node-gyp'
)
provides=('parpar')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/animetosho/ParPar/archive/v${pkgver}.tar.gz")
sha256sums=('422f0c78be2f820546029b6893892b24f84a4f8ace688de2243a86dc5190ab25')

build() {
    rm -rf "${srcdir}"
    mkdir -p "${srcdir}"
    bsdtar -xf "../${_pkgname}-${pkgver}.tar.gz" -C "${srcdir}"
	cd "${srcdir}/ParPar-${pkgver}"
	node-gyp rebuild
	npm install
}

package() {
    mkdir -p "${pkgdir}/usr/bin" \
	         "${pkgdir}/opt/"
	mv "${srcdir}/ParPar-${pkgver}/" "${pkgdir}/opt/parpar/" 
	cd "${pkgdir}/usr/bin"
	ln -s ../../opt/parpar/bin/parpar.js parpar
}

