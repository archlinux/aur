# Maintainer: Mykyta Poturai <mykyta.poturai@tutanota.com>
# Maintainer: Amolith <amolith@secluded.site>
pkgname=hey-mail-bin
pkgver=1.2.14
pkgrel=1
pkgdesc="Hey Mail desktop app"
url="https://hey.com/apps/"
arch=('x86_64')
license=('Proprietary')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3')
makedepends=('squashfs-tools')
provides=('hey-mail')
conflicts=('hey-mail')
SNAPNAME="lfWUNpR7PrPGsDfuxIhVxbj0wZHoH7bK_24.snap"
source=("https://api.snapcraft.io/api/v1/snaps/download/$SNAPNAME")

sha256sums=('b2c2d53ef7ea8a7220b8267a567ef832d2993702ac8e577257c0c2db44200863')
sha512sums=('e557f0c5064a70f614ffc4ff8bd7c9e6fa086b211bc42d4ae63c596b768452bb262af50a3c9ddbe2b804bef04ef108d1298ece632d809919ba82e683b80fa315')
b2sums=('939d4118d9970dc3233f912ff8f3c5ccc137aea83d9c0e4ecb0d40b29323f100f6949f77e4230b000400edcfffe3ad79eb595c7554b4450fda61769e57bc82e1')

# curl -H 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/hey-mail | jq
build() {
	unsquashfs -force -dest root $SNAPNAME
}

package() {
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/opt/hey-mail"
	install -d "$pkgdir/usr/share/applications"
	cp -r root/* "$pkgdir/opt/hey-mail"
	rm -rf "$pkgdir/opt/hey-mail/usr"
	rm -rf "$pkgdir/opt/hey-mail/gnome-platform"
	rm -rf "$pkgdir/opt/hey-mail/lib"
	rm -rf "$pkgdir/opt/hey-mail/libvulkan.so"
	rm -rf "$pkgdir/opt/hey-mail/libGLESv2.so"
	rm -rf "$pkgdir/opt/hey-mail/libEGL.so"
	ln -s /opt/hey-mail/hey-mail "$pkgdir/usr/bin/hey-mail"
	sed "s/\${SNAP}/\/opt\/hey-mail/" root/meta/gui/hey-mail.desktop > "$pkgdir/usr/share/applications/hey-mail.desktop"
}
