# Maintainer: Lakshman Chilukuri <lakshman5876 (at) gmail (dOt) com>

pkgname=rtl8812au_8821au_linux-dkms-git
pkgver=4.3.14.r175.72594b5
pkgrel=1
pkgdesc="Realtek 8812AU/8821AU USB WiFi driver for AC1200 (801.11ac) Wireless Dual-Band USB Adapter"
_modname=rtl8812au
_modver=4.3.14
arch=('x86_64')
url="https://github.com/abperiasamy/rtl8812AU_8821AU_linux"
license=('GPL')
depends=('dkms')
makedepends=('git')
source=("$_modname::git+https://github.com/abperiasamy/rtl8812AU_8821AU_linux.git")
noextract=()
md5sums=('SKIP')

prepare() {
	sed -e "s/#MODULE_VERSION#/$_modver/" -i "$srcdir/$_modname/dkms.conf"
}

pkgver() {
	cd "$srcdir/$_modname"
	printf "%s.r%s.%s" "$_modver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "$pkgdir/usr/src/$_modname-$_modver"
	cd "$srcdir/$_modname"
	cp -r dkms.conf Kconfig Makefile platform core hal include os_dep "$pkgdir/usr/src/$_modname-$_modver"
}
