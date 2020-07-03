# Contributor: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Clovis Fabricio <arch.nosklo@0sg.net>
# Contributor: Christopher Krooß <c.krooss@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
# AUR Category: devel
pkgname=tortoisehg
pkgver=5.4.1
pkgrel=2
#_pkgchangeset=ce30de2c9cb48a703c8d15c5cc11bc75988404fe
pkgdesc="Graphical tools for Mercurial"
url="https://tortoisehg.bitbucket.io"
license=("GPL")
depends=('python' 'mercurial>=5.4' 'mercurial<5.5' 'python-qscintilla-qt5' 'python-iniparse' 'qt5-svg' 'python-pyqt5')
builddepends=(python)
arch=('any')
optdepends=('python-pygments: syntax highlighting'
            'python-nautilus: Python binding for Nautilus components')

if [ -z ${_pkgchangeset+x} ];
then
	source=("https://foss.heptapod.net/mercurial/tortoisehg/thg/-/archive/$pkgver/thg-$pkgver.tar.gz")
else
	source=("$pkgname-$pkgver-${_pkgchangeset}.tar.gz::https://foss.heptapod.net/mercurial/tortoisehg/thg/-/archive/${_pkgchangeset}.tar.gz")
fi

package() {
	if [ -z ${_pkgchangeset+x} ];
	then
		cd "${srcdir}/thg-${pkgver}"
	else
		cd "${srcdir}/thg-${_pkgchangeset}"
	fi

	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -Dm 644 "contrib/mergetools.rc" "${pkgdir}/etc/mercurial/hgrc.d/thgmergetools.rc"
	install -Dm 644 "contrib/thg.desktop" "${pkgdir}/usr/share/applications/thg.desktop"
	install -Dm 644 "icons/svg/thg_logo.svg" "${pkgdir}/usr/share/pixmaps/thg_logo.svg"

	# already provided by hg
	rm -f "${pkgdir}/usr/lib/python3.8/site-packages/hgext3rd/__init__.py"
	rm -f "${pkgdir}/usr/lib/python3.8/site-packages/hgext3rd/__init__.pyc"
	rm -rf "${pkgdir}/usr/lib/python3.8/site-packages/hgext3rd/__pycache__/"
}

sha256sums=('831396eeab66609fcec325247c6729f4a7d6bbb57f3b3ab94d43d8bc147c0628')
