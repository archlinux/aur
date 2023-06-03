# Maintainer: Peter Gaede <peter-gaede@mail.de>

pkgname=gnome-shell-extension-mailnag
pkgver=44
pkgrel=2
pkgdesc="Gnome shell extension for mailnag to show new mails in top bar"
uuid="mailnag@pulb.github.com"
arch=('x86_64')
url="https://github.com/pulb/mailnag-gnome-shell"
license=('GPL')
depends=('folks' 'gnome-shell' 'mailnag')
makedepends=('vala' 'folks')
optdepends=('gnome-online-accounts')
replaces=('mailnag-gnome-shell')
source=("$url/archive/refs/heads/master.zip")
sha256sums=('d3e42603f67cce83ac9c43fdfa7813f609f80f306792754df36b2c5c527589ae')

build() {
	cd $srcdir/mailnag-gnome-shell-master
	valac --pkg folks aggregate-avatars.vala
	
	sed -i "s/40/44/" metadata.json
}

package() {
	cd $srcdir/mailnag-gnome-shell-master
	
	install -d "$pkgdir/usr/bin"
	for p in aggregate-avatars; do
		cp "$p" "$pkgdir/usr/bin/";
		chmod 755 "$pkgdir/usr/bin/$p";
	done
	
	install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/$uuid" extension.js indicator.js utils.js convenience.js prefs.js opts.js stylesheet.css metadata.json

	install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" "schemas/org.gnome.shell.extensions.mailnag.gschema.xml";
}

