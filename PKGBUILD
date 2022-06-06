#Maintainer: Mearaj Bhagad <mearajbhagad at gmail dot com>

pkgname=nordlayer
pkgver=2.4.0
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
sha512sums_x86_64=('e0a05bb72c4275321f745732051623ee36c0f7360377e7e7e237b02fede3beb7d6c40765ee2234d58dfbafbb390020b947de2d07e24dc7f7d6c6d3fef38ceebd')

package(){
	# Extract package data
	#tar xzf data.tar.gz -C "${pkgdir}"
	bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    cp -r "${pkgdir}/usr/sbin/." "${pkgdir}/usr/bin"
    sed -i 's+sbin+bin+g' "${pkgdir}/usr/lib/systemd/system/nordlayer.service"
    rm -r "${pkgdir}/usr/sbin"
}
