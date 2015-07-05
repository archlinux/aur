# Maintainer: gls < ghostlovescorebg at gmail dot com >

pkgname=tacacs-plus
pkgver=4.0.4.28
pkgrel=1
pkgdesc="TACACS+ Daemon"
arch=(i686 x86_64)
url="http://www.shrubbery.net/tac_plus"
license=('Custom')
source=(ftp://ftp.shrubbery.net/pub/tac_plus/tacacs-F${pkgver}.tar.gz)
md5sums=('c8aba0d8f57cab784f1a43499f562b86')
optdepends=('tcp_wrappers')

build() {

	cd ${srcdir}/tacacs-F${pkgver}
	if [ ! -e "/usr/lib/libwrap.a" ]; then
		# If there is no tcp_wrapper, continue without it.
		./configure --prefix=/usr --with-libwrap=no --sbindir=/usr/bin
	else
		# If there is is tcp_wrapper, continue.
		./configure --prefix=/usr --sbindir=/usr/bin
	fi

	# Make and install now.
	make

}

package() {

	cd ${srcdir}/tacacs-F${pkgver}
	make DESTDIR=${pkgdir} install

	# Copy license file.
	install -D -m644 ${srcdir}/tacacs-F${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
