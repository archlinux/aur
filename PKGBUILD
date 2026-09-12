# Maintainer: luytan <luytan@khora.me>

pkgbase=cardwire-bin
pkgname=cardwire-bin
pkgver=0.12.2
pkgrel=1
pkgdesc='GPU manager for Linux using eBPF LSM hooks'
arch=('x86_64')
url='https://github.com/OpenGamingCollective/cardwire'
license=('GPL3')
depends=('hwdata' 'dbus' 'sqlite' 'systemd' 'upower')
source=("https://github.com/OpenGamingCollective/cardwire/releases/download/v$pkgver/cardwire-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('bbcf4f58d2844adfc9ffc9920e31adae6227b595a9ddd6f1a2e7729ce316e9cd')
prepare(){
	tar -xf cardwire-${pkgver}-1-x86_64.pkg.tar.zst
}

package(){
	cd usr
	install -Dm755 bin/cardwire "$pkgdir/usr/bin/cardwire"
	install -Dm755 bin/cardwired "$pkgdir/usr/bin/cardwired"
	install -Dm755 bin/cardwire-gui "$pkgdir/usr/bin/cardwire-gui"
	install -Dm644 lib/systemd/system/cardwired.service "$pkgdir/usr/lib/systemd/system/cardwired.service"
	install -Dm644 share/dbus-1/system.d/org.opengamingcollective.cardwire.conf "$pkgdir/usr/share/dbus-1/system.d/org.opengamingcollective.cardwire.conf"
	install -Dm644 share/applications/cardwire-gui.desktop "$pkgdir/usr/share/applications/cardwire-gui.desktop"
	install -Dm644 share/metainfo/org.opengamingcollective.cardwire.metainfo.xml "$pkgdir/usr/share/metainfo/org.opengamingcollective.cardwire.metainfo.xml"
	for icon in share/icons/hicolor/scalable/apps/*.svg; do
		install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$(basename "$icon")"
	done
	install -Dm644 share/licenses/cardwire/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
