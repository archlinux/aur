# Maintainer: Kisuke-CZE <kisuke@kisuke.cz>
# Contributor: Shameempk <mailtoshameempk@gmail.com>
pkgname=polarr
pkgver=4.4.5
pkgrel=4
pkgdesc="Professional Photo Editing Tools for Everyone."
arch=('x86_64')
url="https://www.polarr.co"
license=('custom')
provides=('polarr')
makedepends=('squashfs-tools' 'sed')
depends=('gconf' 'vips')
source=("https://api.snapcraft.io/api/v1/snaps/download/oOxiekhc2pVHoTfGudxNM0xNUEJWG5jD_3.snap")
sha256sums=('80ea19f34e538f8e5b8d450c8228a81a2368f7e4265726f043fc91437e40116b')

package() {
	mv ${srcdir}/oOxiekhc2pVHoTfGudxNM0xNUEJWG5jD_3.snap ${srcdir}/polarr.snap
	unsquashfs -f -d ${srcdir}/ ${srcdir}/polarr.snap
	rm ${srcdir}/polarr.snap
	mkdir -p ${pkgdir}/usr/lib/polarr/
	cp -a ${srcdir}/resources ${pkgdir}/usr/lib/polarr/
	cp -a ${srcdir}/locales ${pkgdir}/usr/lib/polarr/
	cp -a ${srcdir}/resources ${pkgdir}/usr/lib/polarr/
	find ${srcdir}/ -maxdepth 1 -type f -exec cp -a "{}" ${pkgdir}/usr/lib/polarr/ \;
	mkdir -p ${pkgdir}/usr/bin
	ln -s /usr/lib/polarr/polarr ${pkgdir}/usr/bin/polarr
	cp -a ${srcdir}/snap/gui/icon.png ${pkgdir}/usr/lib/polarr/
	mkdir -p ${pkgdir}/usr/share/applications
	cp -a ${srcdir}/snap/gui/polarr.desktop ${pkgdir}/usr/share/applications/
  ln -s /usr/lib/libIlmImf.so ${pkgdir}/usr/lib/libIlmImf-2_2.so.22
	ln -s /usr/lib/libImath.so ${pkgdir}/usr/lib/libImath-2_2.so.12
	ln -s /usr/lib/libHalf.so ${pkgdir}/usr/lib/libHalf.so.12
	ln -s /usr/lib/libIex.so ${pkgdir}/usr/lib/libIex-2_2.so.12
	ln -s /usr/lib/libIexMath.so ${pkgdir}/usr/lib/libIexMath-2_2.so.12
	ln -s /usr/lib/libIlmThread.so ${pkgdir}/usr/lib/libIlmThread-2_2.so.12

	sed -i 's/Icon=\${SNAP}\/meta\/gui\/icon\.png/Icon=\/usr\/lib\/polarr\/icon\.png/' ${pkgdir}/usr/share/applications/polarr.desktop
	echo 'MimeType=image/jpeg;image/jpeg2000;image/bmp;image/gif;image/png;image/tiff;image/x-raw;' >> ${pkgdir}/usr/share/applications/polarr.desktop
}
