# Maintainer: Ebbez <ebbe at cequent(dot)nl>
_pkgname=multios-usb
pkgname=multios-usb-bin
pkgver=0.11.1
pkgrel=1
pkgdesc='Simple tool for creating GRUB multiboot USB with Secure Boot support.'
arch=('x86_64')
url='https://github.com/Mexit/MultiOS-USB'
license=('GPL-3.0-or-later')
depends=('tar' 'bzip2' 'xz' 'gptfdisk' 'util-linux' 'dosfstools')
optdepends=(
	'exfatprogs: exFAT support'
	'e2fsprogs: ext2/3/4 support'
	'ntfs-3g: NTFS support')
conflicts=('multios-usb' 'multios-usb-bin-git' 'multios-usb-git')
provides=('multios-usb')
source=("$_pkgname-v$pkgver.tar.gz::https://github.com/Mexit/MultiOS-USB/archive/refs/tags/v$pkgver.tar.gz" 
	"multios-usb-launcher.sh")
sha256sums=('c5923c321c2cca53a73fb399c650d1100483bbc906610448b0a542c55c4c46fc'
	'1b795c3590ee2867d2d9baea9897877a2d9f56b5cb49fcfbc67b91bab10d6d1b')

prepare() {
	_extracted_dir=$(bsdtar -tf "${source[0]%%::*}" | awk -F / '{print $1; exit}')

	mv "$_extracted_dir" "$_pkgname-$pkgver"
}

package() {
	install -d "$pkgdir/usr/share/$_pkgname/" "$pkgdir/usr/bin/" "$pkgdir/usr/share/doc/$_pkgname"
	cp -r "$srcdir/$_pkgname-$pkgver/"{binaries,cert,config,config_priv,themes,LICENSE,README.md,MultiOS-USB.version} "$pkgdir/usr/share/$_pkgname"
	cp -r "$srcdir/$_pkgname-$pkgver/docs"/* "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm 755 "$srcdir/$_pkgname-$pkgver/multios-usb.sh" "$pkgdir/usr/share/$_pkgname/multios-usb.sh"
	install -Dm 755 "$srcdir/multios-usb-launcher.sh" "$pkgdir/usr/bin/multios-usb"
}
