# Maintainer: Robert Orzanna <orschiro@googlemail.com>

pkgname=zim-bzr
pkgver=r680
pkgrel=1
pkgdesc="A WYSIWYG text editor that aims at bringing the concept of a wiki to the desktop."
arch=(any)
license=('GPL' 'PerlArtistic')
url="http://zim-wiki.org/"
depends=('pygtk' 'ttf-dejavu')
optdepends=('bzr: Version Control plugin'
	    'gnuplot: Insert Gnuplot plugin'
	    'graphviz: Insert Diagram & Link Map plugins'
	    'python2-gtkspell: Spell Checker plugin'
	    'r: Insert GNU R Plot plugin'
	    'scrot: Insert Screenshot plugin'
	    'texlive-bin: Insert Equation plugin')
makedepends=('bzr')
conflicts=('zim')
install=zim.install
source=("zim::bzr+http://code.launchpad.net/~jaap.karssenberg/zim/pyzim/")
md5sums=('SKIP')

#_bzrtrunk=lp:zim
#_bzrmod=zim

pkgver() {
  cd "$srcdir/zim"
  printf "r%s" "$(bzr revno)"
}

build() {
	cd ${srcdir}/zim

        #msg "Connecting to zim bzr server...."

        #if [ -d $_bzrmod ] ; then
 	    #cd $_bzrmod && bzr pull -r $pkgver
    	    #msg "The local files are updated."
        #else
   	    #bzr branch $_bzrtrunk $_bzrmod -r $pkgver
        #fi

        #msg "bzr checkout done or server timeout"
        #msg "Starting make..."

        #rm -rf $srcdir/$_bzrmod-build
        #cp -r $srcdir/$_bzrmod $srcdir/$_bzrmod-build

        #cd $srcdir/$_bzrmod-build

    # python2 fixes
    #for file in zim/_lib/xdot.py zim/_version.py; do
    #    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
    #done

	sed -i 's|\t\tinstall_class.run(self)|&\n\t\treturn None|' setup.py
}

package() {
	cd $srcdir/zim

	python2 setup.py install --root=${pkgdir} --optimize=1
}
