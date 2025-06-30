# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Sean Snell <ssnell@lakecs.net>
# Submission: not_anonymous <nmlibertarian@gmail.com>

pkgname=hamrs-appimage
_pkgname=hamrs-pro
__pkgname=hamrs
_install_path="/opt/appimages"
pkgver=2.40.0
pkgrel=1
pkgdesc="Ham Radio portable logger tailored for activities like Parks on the Air, Field Day, and others."
arch=('x86_64')
url="https://hamrs.app/"
license=('LicenseRef-custom:electron')
depends=('fuse2' 'hicolor-icon-theme' 'zlib' 'hamradio-menus')
provides=('hamrs')
conflicts=('hamrs')
options=(!strip)
source=("https://$__pkgname-dist.s3.amazonaws.com/$_pkgname-$pkgver-linux-x86_64.AppImage"
	"hamrs-pro.png")

prepare() {
	chmod a+x "$_pkgname-$pkgver-linux-$arch.AppImage"
	"./$_pkgname-$pkgver-linux-$arch.AppImage" --appimage-extract > /dev/null
	sed 's|AppRun|/opt/appimages/hamrs-pro.AppImage|g;s|Utility|HamRadio|g' -i "$srcdir/squashfs-root/$_pkgname.desktop"
}

package() {
	install -Dm755 "$srcdir/$_pkgname-$pkgver-linux-$arch.AppImage" "$pkgdir/$_install_path/$_pkgname.AppImage"
	install -Dm644 "$srcdir/squashfs-root/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	for _icons in 1024x1024;do
	install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/$_icons/apps/$_pkgname.png" \
		"$pkgdir/usr/share/icons/hicolor/$_icons/apps/$_pkgname.png"
	done
	install -Dm644 "$srcdir/$_pkgname.png" \
		"$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"

	install -Dm644 "$srcdir/squashfs-root/LICENSE.electron.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
md5sums=('a3bf9e223e373a0fbc980378f9197274'
         '8b675923edac47fcec1d0f79affde717')
sha256sums=('0d4a9a17c0d0bbe892a42ea79c74fb97b92eacdfcbf7202128e178ee4864a03c'
            '34fd872afa2dc85872f8ec6f4f4cd4380d480cb4d069ecd869e2bb8ed2c4d97c')
