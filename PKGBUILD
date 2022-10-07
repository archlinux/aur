# Maintainer: hu3rror <hu3rror@protonmail.com>
# Former Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=wonderpen-bin
pkgver=2.2.0
_pkgver=6612
pkgrel=1
pkgdesc='A professional writing app with a focused mode and markdown support'
arch=('x86_64')
url='https://www.tominlab.com/en/wonderpen'
license=('custom')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
provides=('wonderpen')
source=("https://file.tominlab.com/WonderPen/${pkgver%.*}/WonderPen_linux_amd64_${pkgver}(${_pkgver}).deb")
sha256sums=('a957592d77597c66286b8f64af11795a8ef643155d5f0d6eb2e8d95935d0b781')

package() {
	# Install
	cd "$srcdir"
	tar -xJf data.tar.xz -C "$pkgdir"
	install -dm755 "$pkgdir"/usr/bin
	ln -s /opt/WonderPen/wonderpen "$pkgdir"/usr/bin/wonderpen
	sed -i 's|^Exec=/opt/WonderPen/wonderpen %U|Exec=wonderpen %F|g' "$pkgdir"/usr/share/applications/wonderpen.desktop
	install -Dm 644 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/wonderpen.png" "${pkgdir}/usr/share/pixmaps/wonderpen.png"
}
