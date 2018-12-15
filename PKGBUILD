# Maintainer: CyrIng <labs[at]cyring[dot]fr>
# Contributor: CyrIng <labs[at]cyring[dot]fr>
_gitname=CoreFreq
pkgname=corefreq-git
realname=corefreq
pkgver=1.39
pkgrel=2.1
pkgdesc="CoreFreq, a processor monitoring software with a kernel module inside."
arch=('x86_64')
url='https://github.com/cyring/CoreFreq'
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=(git+${url}.git)
md5sums=('SKIP')
install=${realname}.install

package() {
	cd ${srcdir}/${_gitname}
	BINDIR=${pkgdir}/bin
	SRCTREE=${pkgdir}/usr/src
	DRVTREE=${SRCTREE}/corefreqk-${pkgver}
	# dkms setup
	install -Dm 0644 Makefile ${DRVTREE}/Makefile
	install -Dm 0644 dkms.conf ${DRVTREE}/dkms.conf
	install -Dm 0755 scripter.sh ${DRVTREE}/scripter.sh
	install -m 0644 *.c *.h ${DRVTREE}/
	# systemd setup
	install -Dm 0644 corefreqd.service \
		${pkgdir}/usr/lib/systemd/system/corefreqd.service
}
