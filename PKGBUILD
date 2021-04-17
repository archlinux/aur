# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=spadfs-utils
pkgver=1.0.13
pkgrel=1
pkgdesc="SPAD filesystem userspace utilities"
arch=(x86_64)
url="https://artax.karlin.mff.cuni.cz/~mikulas/vyplody/spadfs/"
license=(unknown)
optdepends=('spadfs-dkms: DKMS kernel module')
source=(https://artax.karlin.mff.cuni.cz/~mikulas/vyplody/spadfs/download/spadfs-${pkgver}.tar.gz)
sha256sums=('b12a84820f22f14ddc05e19aa8e1a48d1dd6f5bc2fb9b5fbcc122257cb1c1fbb')

package() {
	cd spadfs-${pkgver}

	make mkspadfs spadfsck
	#make SPADFS_CC="custom compiler" SPADFS_CFLAGS="custom CFGLAGS" mkspadfs spadfsck

	install -Dm0755 mkspadfs -t "${pkgdir}"/usr/bin
	install -Dm0755 spadfsck -t "${pkgdir}"/usr/bin
	ln -s /usr/bin/mkspadfs "${pkgdir}"/usr/bin/mkfs.spadfs
	ln -s /usr/bin/spadfsck "${pkgdir}"/usr/bin/fsck.spadfs

	install -Dm0644 {README,INTERNALS,ChangeLog} -t "${pkgdir}"/usr/share/doc/${pkgname}
}
