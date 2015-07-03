pkgname=thebardstale-hib
pkgver=1385084953
pkgrel=2
pkgdesc="An action adventure starring a bard who, not entirely voluntarily, goes on the quest to save a princess"
arch=('i686' 'x86_64')
url="http://www.ubi.com/UK/Games/Info.aspx?pId=1960"
license=('custom:commercial')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_gamepkg="TheBardsTale_linux_${pkgver}.tar.gz"

source=("hib://$_gamepkg"
	"thebardstale.desktop"
	"bardstale.png")

sha512sums=('edd355eed91543745e86a4d24747cbffc893d581dbc64e10bfbc5d0deed03657d780be25ee141f308262a0b7a68198e0d6e0b3ad4f107ff1065a5b5b2e21799c'
	'19aa0d314d128ac3c1af5fe123dd224da416b5150576da9e608aa63379fae077ab2e38a9ad9cfdb4656772e12a25867598736c064a1e253517aace694a496c9e'
	'89e84bf8fbee3a33df2e240a69b01583e102c9621781c3167edb7bb8bc9487b4518831e25cc8ef1006c58a9939b274cc4ac8c7d6363be80817dbe198c32f552a')

PKGEXT='.pkg.tar'

package() {
	mkdir -p "${pkgdir}"/{opt,usr/{bin,share/applications}}
	mv "${srcdir}"/The\ Bard\'s\ Tale "${pkgdir}"/opt/thebardstale
	echo '#!/bin/bash
cd /opt/thebardstale/
./BardTale $@' > "${pkgdir}"/usr/bin/thebardstale
	chmod a+x "${pkgdir}"/usr/bin/thebardstale
	mv "${srcdir}"/thebardstale.desktop "${pkgdir}"/usr/share/applications/
	mv "${srcdir}"/bardstale.png "${pkgdir}"/opt/thebardstale/
}
