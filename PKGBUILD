# $Id$
# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=zim
pkgver=0.67
pkgrel=1
pkgdesc="A WYSIWYG text editor that aims at bringing the concept of a wiki to the desktop."
arch=(any)
license=('GPL' 'PerlArtistic')
url="http://zim-wiki.org/"
depends=('pygtk' 'ttf-dejavu')
optdepends=('bzr: Version Control plugin'
            'git: Version Control plugin'
            'mercurial: Version Control plugin'
            'gnuplot: Insert Gnuplot plugin'
            'ditaa: Insert Ditaa plugin'
            'graphviz: Insert Diagram & Link Map plugins'
            'python2-gtkspell: Spell Checker plugin'
            'r: Insert GNU R Plot plugin'
            'scrot: Insert Screenshot plugin'
            'zeitgeist: Log events with Zeitgeist plugin'
            'lilypond: Insert Score plugin'
            'pygtksourceview2: Source View plugin'
            'texlive-bin: Insert Equation plugin')
source=(http://www.zim-wiki.org/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('e87975727f1166c723912c949bea51f2')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

    # python2 fixes
    for file in zim/inc/xdot.py; do
        sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
    done

	sed -i 's|\t\tinstall_class.run(self)|&\n\t\treturn None|' setup.py
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	python2 setup.py install --root=${pkgdir} --optimize=1
}
