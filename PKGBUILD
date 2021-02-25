# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Pablo Lezaeta <(prflr 88) (arro'a) (gmail) (puntocom)>
pkgname=shim-efi-git
pkgver=15.r190.9c48fc3e
pkgrel=1
pkgdesc='UEFI shim loader'
arch=('x86_64')
url='https://github.com/rhboot/shim'
license=('BSD')
makedepends=('git' 'gnu-efi')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git#branch=main")
sha512sums=('SKIP')

pkgver() {
	cd shim
	git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd shim
	sed -e 's/-Werror //g' -i Makefile Make.defaults
}

build() {
	cd shim
	make
}

package() {
	cd shim
	make DESTDIR="$pkgdir" install-as-data
	install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname"
}
