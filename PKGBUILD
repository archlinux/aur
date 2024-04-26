# Maintainer: Rsplwe <i@rsplwe.com>

pkgname=snipaste
pkgver=2.9_Beta
pkgrel=2
pkgdesc="Snip & Paste!"
arch=('x86_64')
url="https://www.snipaste.com"
license=('custom')
options=(!strip)
depends=()
makedepends=()

source_x86_64=(
	"Snipaste.AppImage::https://download.snipaste.com/archives/Snipaste-2.9-Beta-x86_64.AppImage"
)
sha256sums_x86_64=(
	"6c67c965a3860f8747182325b534c4420b54e63fad5315bed12531f845810d43"
)

noextract=('Snipaste.AppImage')

prepare () {
	chmod +x Snipaste.AppImage
	./Snipaste.AppImage --appimage-extract
}

package() {
	install -d "$pkgdir"/opt/$pkgname
	cp -a ./squashfs-root/usr/. "$pkgdir"/opt/$pkgname

	chmod 755 "$pkgdir"/opt/$pkgname/bin/Snipaste
	chmod 755 "$pkgdir"/opt/$pkgname/bin/wlhelper

	install -d "$pkgdir"/usr/bin
	ln -s /opt/$pkgname/bin/Snipaste "$pkgdir"/usr/bin/Snipaste
	ln -s /opt/$pkgname/bin/wlhelper "$pkgdir"/usr/bin/wlhelper

	install -d "$pkgdir"/usr/share/applications
	ln -s /opt/$pkgname/share/applications/Snipaste.desktop "$pkgdir"/usr/share/applications/Snipaste.desktop

	install -d "$pkgdir"/usr/share/icons
	cp -a ./squashfs-root/usr/share/icons/. "$pkgdir"/usr/share/icons

}
