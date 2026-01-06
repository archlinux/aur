# Maintainer: Rsplwe <i@rsplwe.com>
# Contributor: witt <1989161762 at qq dot com>

pkgname=snipaste
pkgver=2.11.2
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
sha256sums_x86_64=('01a8ca993974c1ab6c99d029b7929834a77532acb9cf1cc8ec0f9dea90d7765b')

noextract=("$pkgname-$pkgver.AppImage")

prepare () {
	chmod +x "$pkgname-$pkgver.AppImage"
	./$pkgname-$pkgver.AppImage --appimage-extract > /dev/null
}

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a ./squashfs-root/usr/. "${pkgdir}/opt/$pkgname"

	chmod 755 "$pkgdir/opt/$pkgname/bin/Snipaste"
	chmod 755 "$pkgdir/opt/$pkgname/bin/wlhelper"

	install -d "$pkgdir"/usr/bin
	ln -s "/opt/$pkgname/bin/Snipaste" "$pkgdir"/usr/bin/Snipaste
	ln -s "/opt/$pkgname/bin/wlhelper" "$pkgdir"/usr/bin/wlhelper

	install -d "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/squashfs-root/Snipaste.desktop" "${pkgdir}/opt/${pkgname}/share/applications/Snipaste.desktop"
	ln -s "/opt/$pkgname/share/applications/Snipaste.desktop" "$pkgdir/usr/share/applications/Snipaste.desktop"

	install -d "$pkgdir"/usr/share/icons
	cp -a ./squashfs-root/usr/share/icons/. "$pkgdir/usr/share/icons"
}
