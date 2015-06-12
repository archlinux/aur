#Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=beatbuddy-hib
pkgver=1396630212
pkgrel=1
pkgdesc="A hand-drawn arcade game with unique music interaction."
url="http://www.threaks.com/"
arch=('i686' 'x86_64')
license=('custom:commercial')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://BeatbuddyLinux_${pkgver}.zip")

sha512sums=('55bb2781a3971fcf55c8361f4bf0e9829e27e59241604773b2e6275bcc502cd82702bb2e818bba29567ce4c0cc1578ba4a85f817282767598884471d30c2175c')

PKGEXT=".pkg.tar"

package() {
	mkdir -p "$pkgdir"/{opt,usr/{bin,share/applications}}
	mv Beatbuddy "$pkgdir"/opt/beatbuddy
	chmod a+x "$pkgdir"/opt/beatbuddy/Beatbuddy.x86
	echo '#!/bin/bash
cd /opt/beatbuddy
./Beatbuddy.x86' > "$pkgdir"/usr/bin/beatbuddy
	chmod a+x "$pkgdir"/usr/bin/beatbuddy
	echo "[Desktop Entry]
Type=Application
Name=Beatbuddy
GenericName=Beatbuddy
Comment=$pkgdesc
Icon=/opt/beatbuddy/Beatbuddy_Data/Resources/UnityPlayer.png
Exec=/usr/bin/beatbuddy
Categories=Game;
Path=/opt/beatbuddy" > "$pkgdir"/usr/share/applications/beatbuddy.desktop
}
