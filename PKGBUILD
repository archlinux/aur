# Maintainer: Philipp Reinkemeier <philipp.reinkemeier@offis.de>

pkgname=pinentry-libsecret
_pkgname=pinentry
pkgver=0.9.7
pkgrel=1
pkgdesc='Collection of simple PIN or passphrase entry dialogs which utilize the Assuan protocol (libsecret enabled)'
url='http://gnupg.org/related_software/pinentry/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses' 'libcap' 'libassuan' 'libsecret')
makedepends=('gtk2' 'qt5-base' 'gcr')
optdepends=('gtk2: gtk2 backend'
            'qt5-base: qt backend'
            'gcr: gnome3 backend')
conflicts=('pinentry')
provides=('pinentry')
source=("ftp://ftp.gnupg.org/gcrypt/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"{,.sig})
sha1sums=('9bdcf5f4096aa8b26956afb0ecdd3d7849ffa0cd' 'SKIP')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6')

install=install

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--enable-pinentry-curses \
		--enable-fallback-curses \
		--enable-pinentry-tty \
		--enable-pinentry-emacs \
		--enable-pinentry-gtk2 \
		--enable-pinentry-gnome3 \
		--enable-pinentry-qt \
		--enable-libsecret \

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
