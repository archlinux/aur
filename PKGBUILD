# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Contributors: Dan Serban, Dany Martineau, RTFreedman, Harvey, Jordi De Groof,
#               qqqqqqqqq9

pkgname=mp3diags
pkgver=1.2.03
pkgrel=1
pkgdesc="Identify issues with your MP3 files, fix those issues and make other changes"
url="http://mp3diags.sourceforge.net/"
license=("GPL")
arch=("i686" "x86_64")
depends=("boost-libs" "qt4")
makedepends=("boost")
optdepends=('mp3gain: MP3 normalization support')
install=mp3diags.install
source=("http://downloads.sourceforge.net/project/mp3diags/mp3diags-src/MP3Diags-${pkgver}.tar.gz")
sha1sums=('53a699b809781819988a17b7558b9c0aab08d76a')

build() {
	cd "${srcdir}/MP3Diags$-${pkgver}"
	./AdjustMt.sh
	qmake-qt4
	make
}

package() {
	cd "${srcdir}/MP3Diags-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
	install -p -m755 "bin/MP3Diags" "${pkgdir}/usr/bin/"
	install -p -m644 "desktop/MP3Diags.desktop" "${pkgdir}/usr/share/applications/"


	for i in "16" "22" "24" "32" "36" "40" "48"; do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
		install -p -m644 "desktop/MP3Diags${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/MP3Diags${_unstable}.png"
	done
}
