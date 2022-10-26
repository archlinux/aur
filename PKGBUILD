# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=spadfs-utils
pkgver=1.0.17
pkgrel=1
pkgdesc="SPAD filesystem userspace utilities"
arch=(x86_64)
url="http://www.jikos.cz/~mikulas/spadfs/"
license=(unknown)
optdepends=('spadfs-dkms: DKMS kernel module')
source=(http://www.jikos.cz/~mikulas/spadfs/download/spadfs-${pkgver}.tar.gz)
sha256sums=('0a703fe1a6a592740b35eff19fc3380c0a678cce9c1df7760a0dfc9b11acfb18')

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
