# $Id$
# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_pkgname=zim
pkgname=${_pkgname}-git
pkgver=0.68.r3.6c427207
pkgrel=1
pkgdesc="A WYSIWYG text editor that aims at bringing the concept of a wiki to the desktop. Git Version"
arch=(any)
license=('GPL' 'PerlArtistic')
url="http://zim-wiki.org/"
depends=('python2')
conflicts=('zim')
replaces=('zim')
optdepends=('bzr: Version Control plugin'
            'ditaa: Insert Ditaa plugin'
            'git: Version Control plugin'
            'gnuplot: Insert Gnuplot plugin'
            'graphviz: Insert Diagram & Link Map plugins'
            'hicolor-icon-theme: hicolor theme hierarchy'
            'lilypond: Insert Score plugin'
            'mercurial: Version Control plugin'
            'pygtksourceview2: Source View plugin'
            'python2-gtkspell: Spell Checker plugin'
            'r: Insert GNU R Plot plugin'
            'scrot: Insert Screenshot plugin'
            'texlive-bin: Insert Equation plugin'
            'zeitgeist: Log events with Zeitgeist plugin'
)

source=('zim-git::git+https://github.com/jaap-karssenberg/zim-desktop-wiki.git')
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd ${srcdir}/${pkgname}

	# python2 fixes
	for file in zim/inc/xdot.py; do
		sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
	done

	sed -i 's|\t\tinstall_class.run(self)|&\n\t\treturn None|' setup.py
}

package() {
	cd ${srcdir}/${pkgname}

	python2 setup.py install --root=${pkgdir} --optimize=1
}
