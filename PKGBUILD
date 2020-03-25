# Maintainer: Nils Czernia <nils[at]czserver.de>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=zenmap
_pkgname=nmap
pkgver=7.80
pkgrel=2
pkgdesc="Graphical Nmap frontend and results viewer"
url="https://nmap.org/"
arch=("any")
license=("GPL2")
depends=("nmap" "pygtk")
validpgpkeys=("436D66AB9A798425FDA0E3F801AF9F036B9355D0")
source=("https://nmap.org/dist/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=("fcfa5a0e42099e12e4bf7a68ebe6fde05553383a682e816a7ec9256ab4773faa")

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/${pkgname}"
	python2 setup.py install --prefix "/usr" --root="${pkgdir}" --optimize=1
	rm "${pkgdir}/usr/bin/uninstall_zenmap"
	ln -s zenmap "${pkgdir}/usr/bin/nmapfe"
	ln -s zenmap "${pkgdir}/usr/bin/xnmap"
	install -Dm644 ../docs/zenmap.1 "${pkgdir}/usr/share/man/man1/zenmap.1"

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "../${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python2 -m compileall "${pkgdir}"/usr/lib/python2.7/site-packages
}
