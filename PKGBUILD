# Maintainer: SanskritFritz (gmail)

pkgname=erebus-git
_gitname="erebusrpg-code"
pkgver=2013.11.24
_stablever=0.10
pkgrel=1
epoch=1
pkgdesc="2D real-time role-playing game."
arch=('i686' 'x86_64')
url="http://erebusrpg.sourceforge.net/"
license=("GPLv3")
depends=('phonon' 'qtwebkit')
makedepends=('qt4' 'git')
provides=('erebus')
conflicts=('erebus')
# Source zip is still needed, see erebus_source.txt
source=("$_gitname::git://git.code.sf.net/p/erebusrpg/code"
        "http://launchpad.net/erebus/trunk/$_stablever/+download/erebussrc.zip")

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
        cd "$srcdir/$_gitname"
	rm -fr sound; mv -f "$srcdir/erebussrc/sound" .
	rm -fr music; mv -f "$srcdir/erebussrc/music" .
	
	qmake-qt4 erebus.pro
	make

}

package() {
	cd "$srcdir/$_gitname"
	make INSTALL_ROOT="$pkgdir" install
	mkdir --parents $pkgdir/usr/bin
	ln -s /opt/erebus/erebus $pkgdir/usr/bin/erebus
}

md5sums=('SKIP'
         'a96fcd43d5741ba11c6b7b9bea38c0f3')
