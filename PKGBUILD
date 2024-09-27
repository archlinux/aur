# Maintainer: Rsplwe <i@rsplwe.com>

pkgname=snipaste
pkgver=2.10.2
pkgrel=1
pkgdesc="Snip & Paste!"
arch=('x86_64')
url="https://www.snipaste.com"
license=('custom')
options=(!strip)
depends=()
makedepends=()
source_x86_64=(
	"$pkgname-$pkgver.AppImage::https://download.snipaste.com/archives/Snipaste-$pkgver-x86_64.AppImage"
)
sha256sums_x86_64=(
	"bbd7b677d6691c36c322c164b1e39d257d8ab299fd4e48457d9c5b7a27a50c0f"
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
