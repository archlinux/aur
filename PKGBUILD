# Maintainer: Felix Bühler <account at buehler dot rocks>
# Contirbutor: Nils Czernia <nils[at]czserver.de>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=zenmap
_pkgname=nmap
pkgver=7.91
pkgrel=1
pkgdesc="Graphical Nmap frontend and results viewer"
url="https://nmap.org/"
arch=("any")
license=("GPL2")
depends=("nmap" "pygtk")
source=("https://nmap.org/dist/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=("18cc4b5070511c51eb243cdd2b0b30ff9b2c4dc4544c6312f75ce3a67a593300")

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
