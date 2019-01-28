# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=efitools-git
pkgver=1.9.2.r0.392836a
pkgrel=1
pkgdesc='UEFI secure boot toolkit'
arch=('x86_64')
url='https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git'
license=('GPL2' 'LGPL2.1')
depends=('openssl')
makedepends=('git' 'gnu-efi-libs' 'help2man' 'perl-file-slurp' 'sbsigntools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf '%s' "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${pkgname%-git}"
	make
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" ARCH="$CARCH" install
}
