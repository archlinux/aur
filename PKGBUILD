# Contributor: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Clovis Fabricio <arch.nosklo@0sg.net>
# Contributor: Christopher Krooß <c.krooss@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
# AUR Category: devel
pkgname=tortoisehg
pkgver=6.4.2
pkgrel=4
pkgdesc="Graphical tools for Mercurial"
arch=('any')
url="https://foss.heptapod.net/mercurial/tortoisehg/thg"
license=("GPL")
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=('python' 'mercurial>=6.0' 'python-qscintilla-qt5' 'python-iniparse' 'qt5-svg' 'python-pyqt5')
optdepends=('python-pygments: syntax highlighting'
            'python-nautilus: Python binding for Nautilus components')
source=("https://www.mercurial-scm.org/release/tortoisehg/targz/tortoisehg-$pkgver.tar.gz")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
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
