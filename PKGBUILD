# Maintainer: robertfoster

pkgname=simonpi-git
pkgver=1.0.4.r0.g33e199d
pkgrel=1
epoch=
pkgdesc="A quick & dirty script to emulate Raspberry PI family devices on your laptop"
arch=(any)
url="https://github.com/M0Rf30/simonpi"
license=('GPL')
depends=('coreutils' 'dnsmasq' 'dosfstools' 'e2fsprogs' 'gawk' 'grep' 'iproute2' 'iptables' 'libarchive' 'procps-ng' 'qemu-headless-arch-extra' 'sudo' 'util-linux' 'wget')
makedepends=('git')
install=
source=("simonpi::git+https://github.com/M0Rf30/simonpi.git")

pkgver() {
	cd $srcdir/simonpi
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $srcdir/simonpi
	install -Dm755 simonpi $pkgdir/usr/bin/simonpi
	install -dm755 $pkgdir/opt/simonpiemu/
	cp simonpiemu/* $pkgdir/opt/simonpiemu/
	sed -i "s/OPT=./OPT=\/opt/g" $pkgdir/usr/bin/simonpi
}

md5sums=('SKIP')
