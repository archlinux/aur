# Maintainer: allencch <allencch at hotmail dot com>
pkgname=weeder
pkgver=1.4.2
pkgrel=4
pkgdesc="Motif (transcription factor binding sites) discovery in sequences from coregulated genes of a single species"
arch=('i686' 'x86_64')
url="http://159.149.160.51/modtools/"
license=('GPL3')
depends=("sh")
source=("http://159.149.160.51/modtools/downloads/${pkgname}${pkgver}.tar.gz")
sha256sums=('17488fcd98d18012141e42f2e68fd71bec8cbbcae109a3a553514a179e30365a')

build() {
	cd "${srcdir}/Weeder${pkgver}"
	sed -i "s|./FreqFiles|/opt/weeder/FreqFiles|g" "src/weederTFBS.c" "src/weederlauncher.c"
	sed -i "s|./adviser.out|adviser.out|g" "src/weederlauncher.c"
	sed -i "s|./weederTFBS.out|weederTFBS.out|g" "src/weederlauncher.c"
	./compileall
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/weeder"
	cd "${srcdir}/Weeder${pkgver}"
	install -m755 *.out "${pkgdir}/usr/bin"
	cp -r FreqFiles "${pkgdir}/opt/weeder"
}
