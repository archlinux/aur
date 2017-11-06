# Maintainer: M0Rf30

pkgname=simonpi-git
pkgver=43.1290883
pkgrel=1
epoch=
pkgdesc="A quick & dirty script to emulate Raspberry PI family devices on your laptop"
arch=(any)
url="https://github.com/M0Rf30/simonpi"
license=('GPL')
depends=('coreutils' 'dnsmasq' 'dosfstools' 'e2fsprogs' 'gawk' 'grep' 'iproute2' 'iptables' 'libarchive' 'procps-ng' 'qemu-arch-extra' 'sudo' 'util-linux' 'wget')
makedepends=('git')
install=
source=("simonpi::git+https://github.com/M0Rf30/simonpi.git")
KERNELRPI=4.4.50
KERNELRPI2=4.9.60

pkgver() {
  cd $srcdir/simonpi
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd $srcdir/simonpi
	install -Dm755 simonpi $pkgdir/usr/bin/simonpi
        install -Dm755 simonpiemu/network $pkgdir/opt/simonpiemu/network
	install -Dm755 simonpiemu/runemu $pkgdir/opt/simonpiemu/runemu
        install -Dm755 simonpiemu/qemu-kernel-$KERNELRPI $pkgdir/opt/simonpiemu/qemu-kernel-$KERNELRPI
        install -Dm755 simonpiemu/qemu-kernel-$KERNELRPI2 $pkgdir/opt/simonpiemu/qemu-kernel-$KERNELRPI2
        install -Dm755 simonpiemu/qemu-kernel-$KERNELRPI2-aarch64 $pkgdir/opt/simonpiemu/qemu-kernel-$KERNELRPI2-aarch64
	install -Dm755 simonpiemu/vexpress-v2p-ca15-tc1.dtb $pkgdir/opt/simonpiemu/vexpress-v2p-ca15-tc1.dtb
	sed -i "s/OPT=./OPT=\/opt/g" $pkgdir/usr/bin/simonpi
}

md5sums=('SKIP')
