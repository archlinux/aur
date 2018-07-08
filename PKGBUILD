# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=linux-user-chroot
pkgver=2015.1
pkgrel=6
pkgdesc='setuid helper for making bind mounts and chrooting'
url='https://gitlab.gnome.org/Archive/linux-user-chroot/'
arch=(i686 x86_64)
license=(GPL)
depends=(libseccomp)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha512sums=('c3356b0d91b70b753ba2bf6d5b67ce6c8f4c5a1620ec88fdcf434bbe57c014ec363739e6ba1f40d67af25f002554d58990c8ab34f6c71e87a6cb3427a37cb392')

build () {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	make install DESTDIR="${pkgdir}"
	chmod +s "${pkgdir}/usr/bin"/linux-user-chroot
	for doc in README NEWS ; do
		install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/${doc}"
	done
}
