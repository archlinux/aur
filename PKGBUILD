# Contributor: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Clovis Fabricio <arch.nosklo@0sg.net>
# Contributor: Christopher Krooß <c.krooss@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
# AUR Category: devel
pkgname=tortoisehg
pkgver=5.0.2
pkgrel=1
#_pkgchangeset=a97baef3d7ce
pkgdesc="Graphical tools for Mercurial"
url="https://tortoisehg.bitbucket.io"
license=("GPL")
depends=('python2' 'mercurial>=4.9' 'mercurial<5.1' 'python2-qscintilla-qt5' 'python2-iniparse' 'qt5-svg')
builddepends=(python2)
arch=('any')
optdepends=('python2-pygments: syntax highlighting'
            'python2-nautilus: Python binding for Nautilus components')

if [ -z ${_pkgchangeset+x} ];
then
	source=("http://bitbucket.org/tortoisehg/targz/downloads/${pkgname}-${pkgver}.tar.gz")
else
	source=("$pkgname-$pkgver-${_pkgchangeset}.tar.gz::https://bitbucket.org/tortoisehg/thg/get/${_pkgchangeset}.tar.gz")
fi

package() {
	if [ -z ${_pkgchangeset+x} ];
	then
		cd "${srcdir}/${pkgname}-${pkgver}"
	else
		cd "${srcdir}/tortoisehg-thg-${_pkgchangeset}"
	fi

	python2 setup.py install --prefix=/usr --root="${pkgdir}"
	install -Dm 644 "contrib/mergetools.rc" "${pkgdir}/etc/mercurial/hgrc.d/thgmergetools.rc"
	install -Dm 644 "contrib/thg.desktop" "${pkgdir}/usr/share/applications/thg.desktop"
	install -Dm 644 "icons/svg/thg_logo.svg" "${pkgdir}/usr/share/pixmaps/thg_logo.svg"

	# already provided by hg 4.0
	rm -f "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.py"
	rm -f "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.pyc"
}

sha256sums=('5fa325a50d5f0602bb239974f22a02bd865d7b3e5ceccb05544ca9ea49e76aba')
