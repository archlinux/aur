# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname='calf-ls'
_pkgname=calf
pkgver=2.1
pkgrel=1
pkgdesc='CGI file lister'
url='http://git.mg0.fr/calf/'
arch=('i686' 'x86_64')
license=('BSD3')
depends=('systemd' 'fcgi' 'uriparser')
source=("http://www.mg0.fr/pub/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('b05b44091208e0d0d726a3106785914e186b21e7')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib \
		--with-fcgi \
		--with-systemd
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 systemd/calf.service ${pkgdir}/usr/lib/systemd/system/calf.service
	install -Dm644 systemd/calf.socket ${pkgdir}/usr/lib/systemd/system/calf.socket
}
