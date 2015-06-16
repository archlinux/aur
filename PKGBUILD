# Maintainer: Jordi De Groof <jordi.degroof@gmail.com>
# Contributors: Dan Serban, Dany Martineau, RTFreedman, Harvey

pkgname=mp3diags
pkgver=1.2.02
pkgrel=1
pkgdesc="Identify issues with your MP3 files, fix those issues and make other changes"
url="http://mp3diags.sourceforge.net/"
license=("GPL")
arch=("i686" "x86_64")
depends=("boost-libs" "qt4")
makedepends=("boost")
optdepends=('mp3gain: MP3 normalization support')
install=mp3diags.install
_unstabl="0"
source=("http://downloads.sourceforge.net/project/mp3diags/mp3diags-src/MP3Diags.tar.gz")
sha1sums=('92b102713ac767ed45476c684f68f0d300fc8354')
# set to 1 to use the unstable version
[ "$_unstabl" = "1" ] && pkgver=1.3.03 
[ "$_unstabl" = "1" ] && source=("http://sourceforge.net/projects/mp3diags/files/unstable/mp3diags-src/MP3Diags-unstable.tar.gz") ;
[ "$_unstabl" = "1" ] && sha1sums=('9afee373045bf13dbded4eb2cd1b7edce90cb7dd') ; 
[ "$_unstabl" = "1" ] && _unstable=-unstable 

build() {
	cd "${srcdir}/MP3Diags${_unstable}-${pkgver}"
	./AdjustMt.sh
	qmake-qt4
	make
}

package() {
	cd "${srcdir}/MP3Diags${_unstable}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
	install -p -m755 "bin/MP3Diags${_unstable}" "${pkgdir}/usr/bin/"
	install -p -m644 "desktop/MP3Diags${_unstable}.desktop" "${pkgdir}/usr/share/applications/"


	for i in "16" "22" "24" "32" "36" "40" "48"; do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
		install -p -m644 "desktop/MP3Diags${_unstable}${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/MP3Diags${_unstable}.png"
	done
}
