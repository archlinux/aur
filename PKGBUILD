# Maintainer: Ebbez <ebbe at cequent(dot)nl>
_pkgname=multios-usb
pkgname=multios-usb-bin-git
pkgver=0.9.9.r8.gbb66853
pkgrel=1
pkgdesc='Simple tool for creating GRUB multiboot USB with Secure Boot support.'
arch=('x86_64')
url='https://github.com/Mexit/MultiOS-USB'
license=('GPL-3.0-or-later')
depends=('tar' 'bzip2' 'xz' 'gptfdisk' 'util-linux')
optdepends=(
	'dosfstools: FAT support'
	'exfatprogs: exFAT support'
	'e2fsprogs: ext2/3/4 support'
	'ntfs-3g: NTFS support')
conflicts=('multios-usb' 'multios-usb-bin' 'multios-usb-git')
provides=('multios-usb')
source=("$_pkgname::git+https://github.com/Mexit/MultiOS-USB.git" 
	"multios-usb-launcher.sh")
sha256sums=('SKIP'
	'1b795c3590ee2867d2d9baea9897877a2d9f56b5cb49fcfbc67b91bab10d6d1b')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -d "$pkgdir/usr/share/$_pkgname/" "$pkgdir/usr/bin/" "$pkgdir/usr/share/doc/$_pkgname"
	cp -r "$srcdir/$_pkgname/"{binaries,cert,config,config_priv,themes,LICENSE,README.md,MultiOS-USB.version} "$pkgdir/usr/share/$_pkgname"
	cp -r "$srcdir/$_pkgname/docs"/* "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm 755 "$srcdir/$_pkgname/multios-usb.sh" "$pkgdir/usr/share/$_pkgname/multios-usb.sh"
	install -Dm 755 "$srcdir/multios-usb-launcher.sh" "$pkgdir/usr/bin/multios-usb"
}
