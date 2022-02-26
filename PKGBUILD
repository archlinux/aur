# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>

pkgname=spadfs-dkms
pkgver=1.0.15
pkgrel=1
pkgdesc="SPAD filesystem kernel module (DKMS package)"
arch=(x86_64)
url="https://artax.karlin.mff.cuni.cz/~mikulas/vyplody/spadfs/"
license=(unknown)
depends=('dkms')
optdepends=('spadfs-utils: mkfs and fsck')
source=("https://artax.karlin.mff.cuni.cz/~mikulas/vyplody/spadfs/download/spadfs-${pkgver}.tar.gz"
        'dkms.conf')
sha256sums=('98e903de83938bd58600316fb5cd9c9e4cc4ca5ee9c909a901a9e5e79705abc2'
            'c19fff6f84ad626459cb08f4accba1320635f9cd7d5a63505b3db527650ecd8d')

package() {
	cd spadfs-${pkgver}

	install -dm755 "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
	#These are already included with spadfs-utils package.
	#install -Dm0644 {README,INTERNALS,ChangeLog} -t "${pkgdir}"/usr/share/doc/${pkgname}
	rm -rf {Changelog,INTERNALS,README}
	rm -rf {utils,spadfs.patch,.gitignore}
    cp -r "${srcdir}"/spadfs-${pkgver}/* "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
    install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
}
