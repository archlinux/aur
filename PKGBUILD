# Maintainer: allencch <allencch at hotmail dot com>
pkgname=gapwm
pkgver=1.0
pkgrel=8
pkgdesc="Genetic Algorithm Method for Optimizing a Position Weight Matrix"
arch=('i686' 'x86_64')
url="https://www.niehs.nih.gov/research/resources/software/biostatistics/gapwm"
license=('gpl')
depends=("sh")
source=("${pkgname}10r1.tar.gz::https://www.niehs.nih.gov/sites/default/files/2024-02/gapwm10r1.tar.gz")
md5sums=('bae6e6202f8ac12765f58e5b442d0f97')

package() {
	cd "${srcdir}/gapwm_1.0"
	#Change the maximum sequence for rocpwm
	sed -i 's/5001/30001/' src/rocpwm/roc_pwm.h
	sed -i 's/MAX_NUM_SEQ,500/MAX_NUM_SEQ,30000/' src/rocpwm/main.c
	./configure --prefix="/usr"
	make DESTDIR="${pkgdir}/" install

	mkdir -p "${pkgdir}/opt/gapwm/examples"
	cp -R "${srcdir}/gapwm_1.0/examples/"{Constraints,PWMs,Seq,avepwm.csh,fitnesspwm.csh,gapwm.csh,rocpwm.csh,README} "${pkgdir}/opt/gapwm/examples"
}
