# Maintainer: Static_Rocket

pkgname=asus-nb-ctrl-git
pkgver=2.0.4.r4.gf61f62c
pkgrel=1
pkgdesc="Asus laptop control utilities"
arch=('x86_64')
url="https://github.com/wroberts/rogauracore"
license=('Mozilla Public License Version 2.0')
depends=('glibc' 'libusb' 'udev' 'systemd' 'hid-asus-rog-dkms-git')
makedepends=('git' 'rust' 'make' 'clang')
source=('git+https://gitlab.com/asus-linux/asus-nb-ctrl.git' 'userpatch.patch')
md5sums=('SKIP' '0add5394ceece18c95d338ec621db3c3')
_gitdir=${pkgname%"-git"}

pkgver() {
	cd "$_gitdir"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_gitdir"
	patch --strip=1 --input="$srcdir/userpatch.patch"
}

build() {
	cd "$_gitdir"
	make
}

package() {
	cd "$_gitdir"
	make DESTDIR="$pkgdir" install
}

