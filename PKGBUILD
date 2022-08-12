# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: K900 <me@0upti.me>
pkgname=windows2usb-git
pkgver=0.2.1.r0.g9f855fa
pkgrel=2
pkgdesc="Windows 7/8/8.1/10 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS) - git version"
arch=("any")
url="https://github.com/ValdikSS/windows2usb"
license=("Apache")
depends=("bash" "awk" "ntfs-3g" "dosfstools" "util-linux" "p7zip" "ms-sys")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git"
		"https://github.com/pbatard/rufus/raw/master/res/uefi/uefi-ntfs.img")
sha256sums=('SKIP'
            '5c7e7aa34261b17ebc82885dab44ce4af0c2397fef9d406a1063f5329b287751')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -D -t "${pkgdir}/usr/share/${pkgname%-git}" -m 644 uefi-ntfs.img
	install -D -t "${pkgdir}/usr/bin" -m 755 "${pkgname%-git}/${pkgname%-git}"
}
# vim:set ts=4 sw=4 et:
