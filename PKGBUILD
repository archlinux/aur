# Maintainer: Felix Bühler <account at buehler dot rocks>
# Contirbutor: Nils Czernia <nils[at]czserver.de>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=zenmap
_pkgname=nmap
pkgver=7.92
pkgrel=4
pkgdesc="Graphical Nmap frontend and results viewer"
url="https://nmap.org/"
arch=("any")
license=("GPL2")
depends=("nmap" "pygtk" "libffi7" "gksu")
source=("https://nmap.org/dist/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=("a5479f2f8a6b0b2516767d2f7189c386c1dc858d997167d7ec5cfc798c7571a1")

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
