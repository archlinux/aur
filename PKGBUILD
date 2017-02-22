# Contributor: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Clovis Fabricio <arch.nosklo@0sg.net>
# Contributor: Christopher Krooß <c.krooss@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
# AUR Category: devel

pkgname=tortoisehg
pkgver=4.1
pkgrel=1
pkgdesc="Graphical tools for Mercurial"
url="http://tortoisehg.bitbucket.org/"
license=("GPL")
depends=('python2' 'mercurial>=4.0' 'python2-pyqt4>=4.10' 'python2-qscintilla' 'python2-iniparse')
builddepends=(python2)
arch=('any')
optdepends=('python2-pygments: syntax highlighting'
	    'python2-nautilus: Python binding for Nautilus components')
source=("http://bitbucket.org/tortoisehg/targz/downloads/${pkgname}-${pkgver}.tar.gz")

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python2 setup.py install --prefix=/usr --root="${pkgdir}"
	install -Dm 644 "contrib/mergetools.rc" "${pkgdir}/etc/mercurial/hgrc.d/thgmergetools.rc"
	install -Dm 644 "contrib/thg.desktop" "${pkgdir}/usr/share/applications/thg.desktop"
	install -Dm 644 "icons/svg/thg_logo.svg" "${pkgdir}/usr/share/pixmaps/thg_logo.svg"

	# already provided by hg 4.0
	rm "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.py"
	rm "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.pyc"
}

sha256sums=('0aea9d73b07fbc74d26a5e8bddc1d2e0edb8d628a679af966b99ae384677f770')
