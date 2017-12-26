# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=clamz
pkgver=0.5
pkgrel=3
pkgdesc="Command-line program to download MP3 files from Amazon.com's music store."
arch=('x86_64')
url='http://code.google.com/p/clamz/'
license=('GPL3')
depends=('libgcrypt' 'curl' 'expat' 'shared-mime-info' 'desktop-file-utils')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/clamz/clamz-${pkgver}.tar.gz")
md5sums=('84543c9346b285bdc218879e241941a8')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Fix issue with update-mime-database
	sed -i 's|$(UPDATE_DESKTOP_DATABASE)\ $(DESTDIR)$(applications_dir)||' Makefile.in
	sed -i 's|$(UPDATE_MIME_DATABASE)\ $(DESTDIR)$(mime_dir)||' Makefile.in

	./configure --prefix=/usr/
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
