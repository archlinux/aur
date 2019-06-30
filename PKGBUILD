# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=budgie-windowshuffler-git
pkgver=r22.01297f8
pkgrel=1
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
	'budgie-window-shuffler-toggle'
	'budgie-window-shuffler-toggle.desktop')
sha256sums=('SKIP'
            'c4ebc452c537d39cd6650bc6d1b5349ea82b1765c25de960ae908d1e528932aa'
            'd350ed513edc6433bc48abe1f0c97f04e7a489830086d5f8344dcf19d2b1e637')

pkgver() {
	cd window-shuffler
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd window-shuffler
	install -d $pkgdir/usr/share/pixmaps
	cp -r icons/* $pkgdir/usr/share/pixmaps
	rm -rf icons
	install -d $pkgdir/usr/share/budgie-desktop/windowshuffler
	cp -r ./* $pkgdir/usr/share/budgie-desktop/windowshuffler
	install -Dm755 $srcdir/budgie-window-shuffler-toggle $pkgdir/usr/bin/budgie-window-shuffler-toggle
	install -Dm644 $srcdir/budgie-window-shuffler-toggle.desktop $pkgdir/usr/share/applications/budgie-window-shuffler-toggle.desktop
}
