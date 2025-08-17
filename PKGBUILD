# Maintainer: Mykyta Poturai <mykyta.poturai@tutanota.com>
# Maintainer: Amolith <amolith@secluded.site>
pkgname=hey-mail-bin
pkgver=1.2.17
pkgrel=1
pkgdesc="Hey Mail desktop app"
url="https://hey.com/apps/"
arch=('x86_64')
license=('Proprietary')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3')
makedepends=('squashfs-tools')
provides=('hey-mail')
conflicts=('hey-mail')
SNAPNAME="lfWUNpR7PrPGsDfuxIhVxbj0wZHoH7bK_28.snap"
source=("https://api.snapcraft.io/api/v1/snaps/download/$SNAPNAME")

b2sums=('581afacd810b73528a13f4867b9ba57224f908e9e59ab9346dcadcaf957f8ebb710f6f7240761ab90fe2bd50af800962dd5a8a2bff7d981583e8b1ae7a11e170')

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
