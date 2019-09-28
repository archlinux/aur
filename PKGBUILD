# Maintainer: Jonas Witschel <diabonas@archlinux.org>
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
source=("git+$url"
        'Make.rules-use-correct-prerequisite-for-blacklist.esl.patch')
sha512sums=('SKIP'
            '62dd458f96b05eb1f07661bda4aaf48abd1aa6646137ca02538903a8b01575ca7651c17ca44b70b46276cc6a04be44deb7d9bcb740c0c4e79cf8f36bb53ddbc2')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	patch --strip=1 --input="$srcdir/Make.rules-use-correct-prerequisite-for-blacklist.esl.patch"
}

build() {
	cd "${pkgname%-git}"
	make
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" ARCH="$CARCH" install
}
