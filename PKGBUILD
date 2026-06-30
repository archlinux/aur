# Maintainer: Matej Dujava <mdujava (plus) aur (at) kocurkovo (dot) cz>

pkgname="fast-vm"
pkgver=1.7
pkgrel=1
pkgdesc="Script for defining VMs from images provided in thin LVM pool - with extra dependencies"
arch=('any')
url="https://github.com/OndrejHome/fast-vm"
license=('GPLv3+')
makedepends=('coreutils' 'bash-completion' 'make')
depends=('bash-completion' 'curl' 'dnsmasq' 'gzip' 'pv' 'xz' 'zstd' 'libguestfs' 'sshpass' 'coreutils' 'gawk' 'libvirt' 'libxml2' 'lvm2' 'ncurses' 'openssh' 'sed' 'sudo' 'util-linux' 'qemu-base' 'bc')
provides=('fast-vm' 'fast-vm-image' 'fast-vm-net-cleanup')
options=('zipman')

source=("fast-vm-$pkgver.tar.gz::https://github.com/OndrejHome/fast-vm/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e802fe69c55e5528b84a1efcbc414c388801743a7feb0b8aab7b927851e7a4a9')

build() {
	cd "$pkgbase-$pkgver"
	sed -i 's|sbindir=/usr/sbin|sbindir=/usr/bin|' Makefile
}

package() {
	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" install
}
