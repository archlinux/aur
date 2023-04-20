# Contributor: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Clovis Fabricio <arch.nosklo@0sg.net>
# Contributor: Christopher Krooß <c.krooss@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
# AUR Category: devel
pkgname=tortoisehg
pkgver=6.4.2
pkgrel=1
#_pkgchangeset=782c0ecf65254899441b496491a4a2d22627938e
pkgdesc="Graphical tools for Mercurial"
url="https://foss.heptapod.net/mercurial/tortoisehg/thg"
license=("GPL")
depends=('python' 'mercurial>=6.0' 'mercurial<6.5' 'python-qscintilla-qt5' 'python-iniparse' 'qt5-svg' 'python-pyqt5')
arch=('any')
optdepends=('python-pygments: syntax highlighting'
            'python-nautilus: Python binding for Nautilus components')

if [ -z ${_pkgchangeset+x} ];
then
	source=("https://www.mercurial-scm.org/release/tortoisehg/targz/tortoisehg-$pkgver.tar.gz")
else
	source=("$pkgname-$pkgver-${_pkgchangeset}.tar.gz::https://foss.heptapod.net/mercurial/tortoisehg/thg/-/archive/${_pkgchangeset}.tar.gz")
fi

package() {
	if [ -z ${_pkgchangeset+x} ];
	then
		cd "${srcdir}/${pkgname}-${pkgver}"
	else
		cd "${srcdir}/thg-${_pkgchangeset}"
	fi

	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -Dm 644 "contrib/mergetools.rc" "${pkgdir}/etc/mercurial/hgrc.d/thgmergetools.rc"
	install -Dm 644 "contrib/thg.desktop" "${pkgdir}/usr/share/applications/thg.desktop"
	install -Dm 644 "icons/svg/thg_logo.svg" "${pkgdir}/usr/share/pixmaps/thg_logo.svg"

	# already provided by hg
	cd "$pkgdir/usr/lib/"
	rm -f python*/site-packages/hgext3rd/__init__.py
	rm -f python*/site-packages/hgext3rd/__init__.pyc
	rm -rf python*/site-packages/hgext3rd/__pycache__/
}

sha256sums=('89fa54348dcb157a43d20816afff01dc2d32c426f1c0b5aa878b7ac460260cd5')
