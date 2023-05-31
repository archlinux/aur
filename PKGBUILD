# Maintainer: Felix Bühler <account at buehler dot rocks>
# Contirbutor: Nils Czernia <nils[at]czserver.de>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=zenmap
_pkgname=nmap
pkgver=7.94
pkgrel=1
pkgdesc="Graphical Nmap frontend and results viewer"
url="https://nmap.org/"
arch=("any")
license=("GPL2")
depends=("python" "python-cairo" "nmap" "gtk3" "python-gobject")
optdepends=("gksu: starting zenmap as root")
source=("https://nmap.org/dist/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=("d71be189eec43d7e099bac8571509d316c4577ca79491832ac3e1217bc8f92cc")

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/${pkgname}"
	python3 setup.py install --prefix "/usr" --root="${pkgdir}" --optimize=1
	rm "${pkgdir}/usr/bin/uninstall_zenmap"
	ln -s zenmap "${pkgdir}/usr/bin/nmapfe"
	ln -s zenmap "${pkgdir}/usr/bin/xnmap"
	install -Dm644 ../docs/zenmap.1 "${pkgdir}/usr/share/man/man1/zenmap.1"

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "../${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python3 -m compileall "${pkgdir}"/usr/lib/python3.11/site-packages
}
