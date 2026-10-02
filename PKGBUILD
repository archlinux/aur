# Maintainer: Ebbez <ebbe at cequent(dot)nl>
# Maintainer: MexIT <mex (hereISdot) it (hereISdot) dev at gmail (hereISdot) com>
_pkgname=multios-usb
pkgname=multios-usb-bin
pkgver=0.14.2
pkgrel=1
pkgdesc='Simple tool for creating GRUB multiboot USB with Secure Boot support.'
arch=('x86_64')
url='https://github.com/Mexit/MultiOS-USB'
license=('GPL-3.0-or-later')
depends=('bash' 'coreutils' 'tar' 'bzip2' 'libarchive' 'xz' 'gptfdisk' 'util-linux' 'dosfstools' 'exfatprogs')
optdepends=(
	'e2fsprogs: ext2/3/4 support'
	'ntfs-3g: NTFS support'
	'rsync: update MultiOS-USB')
conflicts=('multios-usb' 'multios-usb-bin-git' 'multios-usb-git')
provides=('multios-usb')
source=("$_pkgname-v$pkgver.tar.gz::https://github.com/Mexit/MultiOS-USB/archive/refs/tags/v$pkgver.tar.gz"
	"multios-usb-launcher.sh")
sha256sums=('ed86e9f5402319e0725a3f42c34c62269f6a0261c671a58db0c8230a78f4e915'
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
	install -Dm 755 "$srcdir/$_pkgname-$pkgver/common.sh" "$pkgdir/usr/share/$_pkgname/common.sh"
	install -Dm 755 "$srcdir/multios-usb-launcher.sh" "$pkgdir/usr/bin/multios-usb"
}
