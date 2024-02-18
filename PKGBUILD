# Maintainer: allencch <allencch at hotmail dot com>
pkgname=gadem
pkgver=1.3.1
pkgrel=3
pkgdesc="A Genetic Algorithm Guided Formation of Spaced Dyads Coupled with an EM Algorithm for Motif Discovery"
arch=('i686' 'x86_64')
url="http://www.niehs.nih.gov/research/resources/software/biostatistics/gadem/index.cfm"
license=('gpl')
depends=("sh")
source=("${pkgname}_v131.tar.gz::https://www.niehs.nih.gov/sites/default/files/2024-02/${pkgname}_v${pkgver}.tar.gz")
md5sums=('d0e35bea408c2b1a147c8e9f4db72260')

package() {
	cd "${srcdir}/GADEM_v1.3.1"
	sed -i -e 's/GADEM_documentation.pdf/gadem_documentation_v1.3.1.pdf/' Makefile.{am,in}
	./configure --prefix="/usr"

	mkdir -p "${pkgdir}/usr/share/doc"
	make DESTDIR="${pkgdir}/" install
	mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/doc/gadem"



	cd "${srcdir}/GADEM_v1.3.1/examples" && make
	mkdir -p "${pkgdir}/opt/gadem/examples"
	cp "${srcdir}/GADEM_v1.3.1/examples/"{p53KnownSitesEmbeddedInSimulated.seq,run.csh} "${pkgdir}/opt/gadem/examples"

	cd "${srcdir}/GADEM_v1.3.1/OtherTools" && make
	mkdir -p "${pkgdir}/opt/gadem/OtherTools"
	cp "${srcdir}/GADEM_v1.3.1/OtherTools/"{aveCount,example1.sh,example2.sh,kmerFreq,simulateMarkovSeq} "${pkgdir}/opt/gadem/OtherTools"
}
