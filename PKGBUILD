# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=numatop
pkgver=1.0
pkgrel=1
pkgdesc="Observation tool for NUMA systems"
arch=('i686' 'x86_64')
url="https://01.org/numatop/"
license=('custom')
depends=('numactl')
source=("https://01.org/sites/default/files/downloads/numatop_linux_${pkgver}.tar_4.gz")
sha256sums=('8f8b80d006d6fd31f4d63b1bc083ee24d3a7190519952bb7a031eeef58f9fabd')

build() {
	cd "$srcdir/$pkgname"
	make
	gzip -c numatop.8 > numatop.8.gz
}

package() {
	cd "$srcdir/$pkgname"
	install -D --mode=0755 numatop "${pkgdir}/usr/bin/numatop"
	install -D --mode=0644 numatop.8.gz "${pkgdir}/usr/share/man/man8/numatop.8.gz"
	install -D --mode=0644 COPYING "${pkgdir}/usr/share/licenses/numatop/LICENSE"
}
