# Maintainer: SanskritFritz (gmail)

pkgname=simple-indicators
_prgname=SimpleIndicators
pkgver=1.02
pkgrel=2
pkgdesc="Dockapp for system performance indicators."
#url="http://dockapps.windowmaker.org/file.php/id/358"
url="http://web.archive.org/web/20121031043853/http://dockapps.windowmaker.org/file.php/id/358"
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('libdockapp')
makedepends=('imake')
#source=("http://dockapps.windowmaker.org/download.php/id/843/$_prgname.tar.gz")
source=("simple-indicators-1.02-1.src.tar.gz")

build() {
	cd "$srcdir/Source/disk_cpu_swp_ram"
	xmkmf
	make

	cd "$srcdir/Source/free"
	xmkmf
	make

	cd "$srcdir/Source/net"
	xmkmf
	make
}

package() {
	mkdir --parents "$pkgdir/usr/bin"
	cp "$srcdir/Source/disk_cpu_swp_ram/disk_cpu_swp_ram" "$pkgdir/usr/bin/wmdisk_cpu_swp_ram"
	cp "$srcdir/Source/free/free" "$pkgdir/usr/bin/wmfree"
	cp "$srcdir/Source/net/net" "$pkgdir/usr/bin/wmnet"
	mkdir --parents "$pkgdir/usr/share/doc"
	cp "$srcdir/Readme.rtf" "$pkgdir/usr/share/doc"
	msg "--------------------------------"
	msg "WARNING: the binaries were renamed into wmdisk_cpu_swp_ram, wmfree, wmnet."
	msg "--------------------------------"
}

md5sums=('8d497a78d15aeb99effbd37d4718f577')
