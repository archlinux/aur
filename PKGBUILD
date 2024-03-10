# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Radu Potop <radu@wooptoo.com>

projname=zim-desktop-wiki
pkgname=zim-dev
pkgver=0.75.2.59.g4e6c9
pkgrel=1
pkgdesc="Zim desktop wiki. Develop branch"
arch=(any)
license=('GPL-2.0-only')
url="https://zim-wiki.org/"
conflicts=('zim')
provides=('zim')
depends=('python' 'python-gobject' 'ttf-font' 'gtk3' 'python-xdg')
checkdepends=('xorg-server-xvfb')
optdepends=('bzr: Version Control plugin'
            'git: Version Control plugin'
            'mercurial: Version Control plugin'
            'gnuplot: Insert Gnuplot plugin'
            'ditaa: Insert Ditaa plugin'
            'graphviz: Insert Diagram plugin'
            'xdot: Link Map plugin'
            'gtkspell3: Spell Checker plugin'
            'r: Insert GNU R Plot plugin'
            'scrot: Insert Screenshot plugin'
            'lilypond: Insert Score plugin'
            'gtksourceview3: Source View plugin'
            'texlive-bin: Insert Equation plugin')
source=("git+https://github.com/$projname/$projname.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
    cd "$projname"
    echo "$(git describe --abbrev=4 --always --tags | sed 's/-/./g')"
}

check() {
	cd "${srcdir}/${projname}"
}

package() {
	cd "${srcdir}/${projname}"

	python setup.py install --root="${pkgdir}" --optimize=1

	install -dm755 "$pkgdir/usr/share/icons/"
	cp -r xdg/hicolor/ "$pkgdir/usr/share/icons/"
}
