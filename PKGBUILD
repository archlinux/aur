# Maintainer: Malacology <guoyizhang at malacology dot net>

pkgname=morphoj
pkgver=1.08.02
pkgrel=1
pkgdesc="integrated program package for doing geometric morphometrics \
	 https://doi.org/10.1111/j.1755-0998.2010.02924.x"
arch=('x86_64')
depends=('java-runtime=17' 'alsa-lib' 'glibc' 'zlib' 'freetype2' 'hicolor-icon-theme')
makedepends=('tar')
url="https://morphometrics.uk/MorphoJ_page.html"
license=('Apache-2.0')
source=("https://morphometrics.uk/MorphoJ_stuff/download.php?get=MorphoJ-${pkgver}_amd64.deb")
sha256sums=('4c9b68d5ee8d2e9957c095f7a4de4b6a332c4fee04a33cac49e61af84e3203b2')
build() {
        tar -p -xf data.tar.zst -C "${srcdir}"
}
package() {
	mkdir -p $pkgdir/usr/{bin,share/$pkgname}
	cd $srcdir/opt/morphoj

	sed -i "s@/opt/morphoj/bin@/usr/bin@g;s@/opt/morphoj/lib/@/usr/share/icons/hicolor/128x128/apps/@g" lib/morphoj-MorphoJ.desktop	
	install -Dm755 lib/morphoj-MorphoJ.desktop $pkgdir/usr/share/applications/MorphoJ.desktop
	rm lib/morphoj-MorphoJ.desktop

	install -Dm755 lib/MorphoJ.png $pkgdir/usr/share/icons/hicolor/128x128/apps/MorphoJ.png
	rm lib/MorphoJ.png

	chmod +x bin/MorphoJ
	ln -s /usr/share/morphoj/bin/MorphoJ $pkgdir/usr/bin/MorphoJ

	mv bin $pkgdir/usr/share/$pkgname/
	mv lib $pkgdir/usr/share/$pkgname/
}
