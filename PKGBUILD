# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname=arch-prime-git
pkgver=0.8.1.arch.r0.g51c12c2
pkgver() {
  cd ArchPrime
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc='Provide nvidia-prime like package for Archlinux'
arch=('any')
url='https://gitlab.com/NickCao/ArchPrime'
license=('GPL3')
depends=('bash')
makedepends=('git')
optdepends=('bbswitch: for powering off the nvidia GPU')
source=('git+https://gitlab.com/NickCao/ArchPrime')
md5sums=('SKIP')

package() {
	install -Dm644 $srcdir/ArchPrime/xorg-intel.conf $pkgdir/etc/prime/xorg-intel.conf
	install -Dm644 $srcdir/ArchPrime/xorg-intel-intel.conf $pkgdir/etc/prime/xorg-intel-intel.conf
	install -Dm644 $srcdir/ArchPrime/xorg-nvidia.conf $pkgdir/etc/prime/xorg-nvidia.conf

	install -Dm644 $srcdir/ArchPrime/09-nvidia-modprobe-bbswitch.conf $pkgdir/etc/prime/09-nvidia-modprobe-bbswitch.conf
	install -Dm644 $srcdir/ArchPrime/09-nvidia-modprobe-pm.conf $pkgdir/etc/prime/09-nvidia-modprobe-pm.conf
	install -Dm644 $srcdir/ArchPrime/90-nvidia-udev-pm.rules $pkgdir/etc/prime/90-nvidia-udev-pm.rules 
	install -Dm644 $srcdir/ArchPrime/bbswitch.conf $pkgdir/etc/prime/bbswitch.conf

	install -Dm644 $srcdir/ArchPrime/prime-select.service $pkgdir/usr/lib/systemd/system/prime-select.service
	install -Dm755 $srcdir/ArchPrime/prime-select.sh $pkgdir/usr/bin/prime-select
}
