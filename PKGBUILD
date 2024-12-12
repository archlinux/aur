# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>

pkgname=spadfs-dkms
pkgver=1.0.20
pkgrel=1
pkgdesc="SPAD filesystem kernel module (DKMS package)"
arch=(x86_64)
url="http://www.jikos.cz/~mikulas/spadfs/"
license=(unknown)
depends=('dkms')
optdepends=('spadfs-utils: mkfs and fsck')
source=("http://www.jikos.cz/~mikulas/spadfs//download/spadfs-${pkgver}.tar.gz"
        'dkms.conf')
sha256sums=('579a2b478dfd87c6dbc25faad25caf8e1d54c261f50b55ad7269e756f448627a'
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
