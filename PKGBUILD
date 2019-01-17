# Maintainer: Alif <alive4ever at live.com>
pkgname=wimboot-git
pkgver=v2.6.0.r3.91be50c
pkgrel=1
pkgdesc="iPXE kernel to boot wim images from network for both UEFI and BIOS system"
arch=(any)
url="https://git.ipxe.org/wimboot.git"
license=('GPL')
makedepends=('git' 'pesign' 'gcab')
optdepends=("ipxe-git: iPXE network boot program"
	"ipxe-netboot: Alternative iPXE network boot program, with Archlinux network install support")
install=$pkgname.install
source=('wimboot::git+https://git.ipxe.org/wimboot.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}/src"
	make
}	

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 README.txt $pkgdir/usr/share/wimboot/README.txt
	install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/wimboot/LICENSE.txt
	cd "$srcdir/${pkgname%-git}/src"
	for a in wimboot wimboot.x86_64 wimboot.x86_64.efi wimboot.i386 wimboot.i386.efi wimboot.cab ; do
	install -Dm755 $a $pkgdir/usr/share/wimboot/$a
	done
}
