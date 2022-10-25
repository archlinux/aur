# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Dave Reisner <dreisner@archlinux.org> ([core] package)
# Maintainer: Thomas Bächler <thomas@archlinux.org> ([core] package)

pkgname=mkinitcpio-git
pkgver=32.r0.g0be0de5
pkgrel=1
pkgdesc='Modular initramfs image creation utility - git checkout'
arch=('any')
url='https://github.com/archlinux/mkinitcpio'
license=('GPL')
depends=('awk' 'mkinitcpio-busybox' 'kmod' 'util-linux' 'libarchive' 'coreutils'
         'bash' 'binutils' 'diffutils' 'findutils' 'grep' 'filesystem' 'zstd' 'systemd')
optdepends=('gzip: Use gzip compression for the initramfs image'
            'xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
makedepends=('git' 'asciidoc')
provides=('initramfs' "mkinitcpio=${pkgver}")
conflicts=('mkinitcpio')
backup=('etc/mkinitcpio.conf')
source=('git+https://github.com/archlinux/mkinitcpio.git?signed')
sha256sums=('SKIP')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'C100346676634E80C940FB9E9C02FF419FECBE16'    # Morten Linderud
              'BB8E6F1B81CF0BB301D74D1CBF425A01E68B38EF')   # nl6720

pkgver() {
	cd mkinitcpio/

	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd mkinitcpio/

	make DESTDIR="${pkgdir}" install
}
