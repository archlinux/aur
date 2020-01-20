# Maintainer:
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: DonHugo
pkgname=budgie-windowshuffler-git
pkgver=r22.01297f8
pkgrel=2
pkgdesc='GUI and keyboard friendly window arranger for the Budgie and MATE desktop'
arch=('any')
url='https://github.com/UbuntuBudgie/window-shuffler'
license=('GPL3')
depends=('wmctrl' 'xdotool' 'python-cairo' 'python-gobject')
optdepends=('budgie-desktop: The Budgie desktop'
            'mate-desktop: The MATE desktop'
            'libwnck3: required on GNOME, may be required on other desktops'
            'xorg-xprop: required on GNOME, may be required on other desktops')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/UbuntuBudgie/window-shuffler.git'
	"${pkgname%-git}-toggle"
	"${pkgname%-git}-toggle.desktop")
sha256sums=('SKIP'
            'c4ebc452c537d39cd6650bc6d1b5349ea82b1765c25de960ae908d1e528932aa'
            'ef1b4bce706365115c7faefed88568bbf339dba9f2c67b18a4dbb49702b58e98')

pkgver() {
	cd window-shuffler
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd window-shuffler
	install -d $pkgdir/usr/share/{pixmaps,budgie-desktop/windowshuffler}
	cp -r icons/* $pkgdir/usr/share/pixmaps
	rm -rf icons
	cp -r ./* $pkgdir/usr/share/budgie-desktop/windowshuffler
	install -Dm755 "$srcdir/${pkgname%-git}-toggle" \
		"$pkgdir/usr/bin/${pkgname%-git}-toggle"
	install -Dm644 "$srcdir/${pkgname%-git}-toggle.desktop" \
		"$pkgdir/usr/share/applications/${pkgname%-git}-toggle.desktop"
}
