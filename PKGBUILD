# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=gnu-efi-libs-fedora-git
pkgver=r237.4eaf7e1
pkgrel=1
pkgdesc='Library for building UEFI Applications using GNU toolchain (Fedora development version)'
arch=('x86_64')
url='https://sourceforge.net/projects/gnu-efi/'
license=('BSD')
makedepends=('git')
provides=("${pkgname%-fedora-git}")
conflicts=("${pkgname%-fedora-git}")
source=("git+https://github.com/vathpela/gnu-efi.git#branch=fedora-32")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-libs-fedora-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-libs-fedora-git}"
	make
	LDFLAGS='' make apps
}

package() {
	cd "${pkgname%-libs-fedora-git}"
	make INSTALLROOT="$pkgdir" PREFIX=/usr install
	install -Dm644 "$srcdir/${pkgname%-libs-fedora-git}/x64/apps"/*.efi -t "$pkgdir/usr/share/gnu-efi/apps/x64"
	install -Dm644 "$srcdir/${pkgname%-libs-fedora-git}/README.efilib" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
