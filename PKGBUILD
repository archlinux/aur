# Maintainer: robertfoster

pkgname=simonpi-git
pkgver=1.0.12.r0.g804baed
pkgrel=2
pkgdesc="A quick & dirty script to emulate Raspberry PI family devices on your laptop"
arch=(any)
url="https://github.com/M0Rf30/simonpi"
license=('GPL')
depends=('coreutils' 'dnsmasq' 'dosfstools' 'e2fsprogs' 'file' 'grep' 'iproute2' 'iptables' 'libarchive' 'ovmf-arm' 'ovmf-aarch64' 'procps-ng' 'qemu-headless-arch-extra' 'sudo' 
'util-linux' 'wget')
makedepends=('git')
install=simonpi-git.install
source=("simonpi::git+https://github.com/M0Rf30/simonpi.git")

pkgver() {
	cd $srcdir/simonpi
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $srcdir/simonpi
	install -Dm755 simonpi $pkgdir/usr/bin/simonpi
	install -dm755 $pkgdir/opt/simonpiemu/
	cp -r simonpiemu/* $pkgdir/opt/simonpiemu/
	sed -i "s/OPT=./OPT=\/opt/g" $pkgdir/usr/bin/simonpi
}

md5sums=('SKIP')
