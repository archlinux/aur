# Maintainer: Quinn "heddwch" Evans <yoshizuki at gmail dot com>
pkgname=virtualt
pkgver=1.7
pkgrel=1
pkgdesc="A Tandy Model 100-family computer emulator"
arch=('i686' 'x86_64')
url="https://virtualt.sourceforge.net"
license=('unknown')
depends=('fltk')
source=("virtualt-src-v${pkgver}.zip::https://sourceforge.net/projects/virtualt/files/Source/v${pkgver}/virtualt-src-v${pkgver}.zip/download" 'patch.sh' 'virtualt')

prepare() {
	cd virtualt-src-v${pkgver}/src
	sh ${srcdir}/patch.sh
}

build() {
	cd virtualt-src-v${pkgver}
	make
}

package() {
	cd virtualt-src-v${pkgver}

	# Install ROMs and main binary in /usr/lib/virtualt
	mkdir -p ${pkgdir}/usr/lib/virtualt/ROMs
	install -m 644 ROMs/* ${pkgdir}/usr/lib/virtualt/ROMs
	install virtualt ${pkgdir}/usr/lib/virtualt

	# Install documentation
	mkdir -p ${pkgdir}/usr/share/doc/virtualt/manual
	install -m 644 README.md release.txt ${pkgdir}/usr/share/doc/virtualt
	install -m 644 doc/* ${pkgdir}/usr/share/doc/virtualt/manual

	# Record system package release
	mkdir -p ${pkgdir}/usr/share/virtualt
	echo ${pkgver}-${pkgrel} > ${pkgdir}/usr/share/virtualt/version
	
	# Install executables
	mkdir -p ${pkgdir}/usr/bin
	install vt_client ${srcdir}/virtualt ${pkgdir}/usr/bin
}

md5sums=('7be739db0877b954566515bc31621cff'
         '5f7ebd746f134cdb133fbeebbf9713d3'
         '346f6ab2d7c6af3d8c6fbdabbe2a734f')
