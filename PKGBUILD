# Maintainer: Stick <stick@stma.is>
_pkg=blc
pkgname="$_pkg-git"
pkgver=r47.d4a669e
pkgrel=1
pkgdesc="Integrate Ghidra's decompiler as an Ida plugin"
arch=(x86_64)
url='https://github.com/cseagle/blc'
license=(GPL2)
depends=(ida-free ghidra)
makedepends=(git)
install=blc.install
source=("$pkgname::git+$url"
	'ida-ghidra-blc.sh'
	'blc.install')
sha256sums=('SKIP'
	'3aa1f22668db30742a7c12c21b129f6424dc7fd413b0aa1385c7b5f11db018eb'
	'1e202b3da7365044c7d372d1f671bcdb27582c62477ecb5c71812371410de39a')

pkgver() {
	cd "$pkgname" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	install -d "$pkgdir"/opt/ida-free/plugins
	install -d "$pkgdir"/etc/profile.d
	install "$pkgname"/bins/linux/ida70/* "$pkgdir"/opt/ida-free/plugins/
	install ida-ghidra-blc.sh "$pkgdir"/etc/profile.d/
}
