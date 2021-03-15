# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver=0.1.2
pkgrel=1
pkgdesc="boot environment manager for ZFS"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPL')
depends=('coreutils' 'awk' 'sed' 'grep' 'zfs-utils' 'sh')
optdepends=('grub: select boot environment at boot')
source=(
	"$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
	"0000-10_linux-detect-archlinux-initramfs.patch"
)
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
prepare() {
	cd "${srcdir}/$pkgname-$pkgver/"
	echo "Patch GRUB detection of Arch Linux initramfs/fallback..."
	patch -Np1 -i "${srcdir}/0000-10_linux-detect-archlinux-initramfs.patch"
}
md5sums=('ef85ea278e210d392997ea53f1b5e390'
         'ef173ee9b642c5f51b1b5a3e3138f1c5')
