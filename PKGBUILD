# Maintainer: Rsplwe <i@rsplwe.com>

pkgname=snipaste
pkgver=2.9.2_Beta
pkgrel=2
pkgdesc="Snip & Paste!"
arch=('x86_64')
url="https://www.snipaste.com"
license=('custom')
options=(!strip)
depends=()
makedepends=()
source_x86_64=(
	"$pkgname-$pkgver.AppImage::https://download.snipaste.com/archives/Snipaste-2.9.2-Beta-x86_64.AppImage"
)
sha256sums_x86_64=(
	"a15ebdb80063ce46d07706fed70451c6cce1af0238bb2ce1419e1a5c19f27a8f"
)

noextract=("$pkgname-$pkgver.AppImage")

prepare () {
	chmod +x "$pkgname-$pkgver.AppImage"
	./$pkgname-$pkgver.AppImage --appimage-extract
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
