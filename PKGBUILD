# Maintainer: Kisuke-CZE <kisuke@kisuke.cz>
# Contributor: Shameempk <mailtoshameempk@gmail.com>
pkgname=polarr
pkgver=5.2.1
pkgrel=1
pkgdesc="Professional Photo Editing Tools for Everyone."
arch=('x86_64')
url="https://www.polarr.co"
license=('custom')
provides=('polarr')
makedepends=('squashfs-tools' 'sed')
depends=('gconf')
source=("https://api.snapcraft.io/api/v1/snaps/download/oOxiekhc2pVHoTfGudxNM0xNUEJWG5jD_9.snap")
sha256sums=('32eff3700dc784164b7b61f22acede0061205dfef0111caf6109e054787be299')

package() {
	mv ${srcdir}/oOxiekhc2pVHoTfGudxNM0xNUEJWG5jD_9.snap ${srcdir}/polarr.snap
	unsquashfs -f -d ${srcdir}/ ${srcdir}/polarr.snap
	rm ${srcdir}/polarr.snap

	mkdir -p ${pkgdir}/usr/lib/polarr/
	cp -a ${srcdir}/app/* ${pkgdir}/usr/lib/polarr/

	mkdir -p ${pkgdir}/usr/bin
	ln -s /usr/lib/polarr/polarr ${pkgdir}/usr/bin/polarr
	cp -a ${srcdir}/snap/gui/icon.png ${pkgdir}/usr/lib/polarr/
	mkdir -p ${pkgdir}/usr/share/applications
	cp -a ${srcdir}/snap/gui/polarr.desktop ${pkgdir}/usr/share/applications/
	sed -i 's/Icon=\${SNAP}\/meta\/gui\/icon\.png/Icon=\/usr\/lib\/polarr\/icon\.png/' ${pkgdir}/usr/share/applications/polarr.desktop
}
