# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=spadfs-utils
pkgver=1.0.20
pkgrel=1
pkgdesc="SPAD filesystem userspace utilities"
arch=(x86_64)
url="http://www.jikos.cz/~mikulas/spadfs/"
license=(unknown)
optdepends=('spadfs-dkms: DKMS kernel module')
source=(http://www.jikos.cz/~mikulas/spadfs/download/spadfs-${pkgver}.tar.gz)
sha256sums=('579a2b478dfd87c6dbc25faad25caf8e1d54c261f50b55ad7269e756f448627a')

package() {
	cd spadfs-${pkgver}

	make mkspadfs spadfsck
	#make SPADFS_CC="custom compiler" SPADFS_CFLAGS="custom CFLAGS" mkspadfs spadfsck

	install -Dm0755 mkspadfs -t "${pkgdir}"/usr/bin
	install -Dm0755 spadfsck -t "${pkgdir}"/usr/bin
	ln -s /usr/bin/mkspadfs "${pkgdir}"/usr/bin/mkfs.spadfs
	ln -s /usr/bin/spadfsck "${pkgdir}"/usr/bin/fsck.spadfs

	install -Dm0644 {README,INTERNALS,ChangeLog} -t "${pkgdir}"/usr/share/doc/${pkgname}
}
