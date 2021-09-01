# Maintainer: Harvey <harv|at|gmx.de>
# Contributors: Dan Serban, Dany Martineau, Jordi De Groof, RTFreedman

pkgname="mp3diags-unstable"
pkgver="1.5.02"
pkgrel=1
pkgdesc="Identify issues with your MP3 files, fix those issues and make other changes"
url="http://mp3diags.sourceforge.net/"
license=("GPL")
arch=("x86_64")
depends=("boost-libs" "qt5-base")
makedepends=("boost")
optdepends=('mp3gain: MP3 normalization support')
source=("http://sourceforge.net/projects/mp3diags/files/unstable/mp3diags-src/MP3Diags-unstable-${pkgver}.tar.gz")
sha1sums=('8764aa9cb4eac097cfeaf8ca9c0306d14a50999e')

build() {
	cd "${srcdir}/MP3Diags-unstable-${pkgver}"
	./AdjustMt.sh
	qmake-qt5
	make
        strip bin/MP3Diags-unstable
}

package() {
 	cd "${srcdir}/MP3Diags-unstable-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
	install -p -m755 "bin/MP3Diags-unstable" "${pkgdir}/usr/bin/"
	install -p -m644 "desktop/MP3Diags-unstable.desktop" "${pkgdir}/usr/share/applications/"
    
	for i in "16" "22" "24" "32" "36" "40" "48"; do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
		install -p -m644 "desktop/MP3Diags-unstable${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/MP3Diags-unstable.png"
	done
}
