#Maintainer: Mearaj Bhagad <mearajbhagad at gmail dot com>

pkgname=nordlayer
pkgver=2.6.0
pkgrel=2
pkgdesc="Proprietary VPN client for linux"
arch=('i686' 'x86_64')
url="https://nordlayer.com"
license=('custom')
replaces=('nordvpnteams-bin')
conflicts=('nordvpnteams-bin')
depends=('bash')
#backup=('etc/default/nordlayer' 'etc/nordlayer/config.hcl' 'etc/nordlayer/ipsec.secrets')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://downloads.nordlayer.com/linux/latest/debian/pool/main/${pkgname}_${pkgver}_amd64.deb")
sha512sums_x86_64=('824460f53703e5758dc3b3d8bf1aed3ae80613abed55ae1a04573adfaf397c830d4509ab726c3dd03d53929dd5906699bacd358f1ceece763a369d63a37977ef')

package(){
	# Extract package data
	#tar xzf data.tar.gz -C "${pkgdir}"
	bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    cp -r "${pkgdir}/usr/sbin/." "${pkgdir}/usr/bin"
    sed -i 's+sbin+bin+g' "${pkgdir}/usr/lib/systemd/system/nordlayer.service"
    rm -r "${pkgdir}/usr/sbin"
}
