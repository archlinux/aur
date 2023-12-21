# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org> ([core] package)
# Contributor: Morten Linderud <foxboron@archlinux.org> ([core] package)
# Contributor: Dave Reisner <dreisner@archlinux.org> ([core] package)
# Contributor: Thomas Bächler <thomas@archlinux.org> ([core] package)

pkgname=mkinitcpio-git
pkgver=37.1.r17.ge7e20f2
pkgrel=1
pkgdesc='Modular initramfs image creation utility - git checkout'
arch=('any')
url='https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio'
license=('GPL-2.0-only')
depends=('awk' 'mkinitcpio-busybox' 'kmod' 'util-linux' 'libarchive' 'coreutils'
         'bash' 'binutils' 'diffutils' 'findutils' 'grep' 'filesystem' 'zstd' 'systemd')
optdepends=('gzip: Use gzip compression for the initramfs image'
            'xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
makedepends=('git' 'asciidoc')
checkdepends=('bats' 'bats-assert' 'bzip2' 'gzip' 'lz4' 'lzop')
provides=('initramfs' "mkinitcpio=${pkgver}")
conflicts=('mkinitcpio')
backup=('etc/mkinitcpio.conf')
source=('git+https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio.git?signed')
sha256sums=('SKIP')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'C100346676634E80C940FB9E9C02FF419FECBE16'    # Morten Linderud
              'BB8E6F1B81CF0BB301D74D1CBF425A01E68B38EF')   # nl6720

pkgver() {
	cd mkinitcpio/

	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd mkinitcpio/

	make check
}

package() {
	cd mkinitcpio/

	make DESTDIR="${pkgdir}" install
}
