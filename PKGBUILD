# Maintainer: robertfoster

pkgname=simonpi-git
pkgver=80.46e7e9d
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

pkgver() {
  cd $srcdir/simonpi
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd $srcdir/simonpi
	install -Dm755 simonpi $pkgdir/usr/bin/simonpi
        install -dm755 $pkgdir/opt/simonpiemu/
        cp simonpiemu/* $pkgdir/opt/simonpiemu/
	sed -i "s/OPT=./OPT=\/opt/g" $pkgdir/usr/bin/simonpi
}

md5sums=('SKIP')
