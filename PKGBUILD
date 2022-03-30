# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade
pkgver=2022.01a
pkgrel=3
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling."
arch=("x86_64")
url='https://yade-dem.org/doc/index.html'
license=('GPL2')
depends=(
    'cgal' 'coin-or-clp' 'freeglut' 'gl2ps'
    'gts' 'ipython' 'libqglviewer' 'openmpi' 
    'python-mpmath' 'python-xlib' 'python-future' 'python-pyqt5'
    'vtk'
)

optdepends=(
'cuda: GPU acceleration'
'python-matplotlib: plotting graphs' 
'python-mpi4py: passing all tests' 
'tk: passing all tests' 
)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://dl.sukanka.com/d/ali/software/yade/yade-${pkgver}-${pkgrel}.tar.gz"
)
sha512sums=('7144b5e37b67c6def336ee949324ce102f31a39e71dd46605397a649fd56981df8db3d51a32e13a3b2bbe803521a43caa75cf780550a4d6e4e05b743e7485a67')

package(){
   mv $srcdir/usr ${pkgdir}
   
   # Fix ref to $srcdir
   rplc='\x0'
    for ((i=1;i <=${#srcdir};i++))
    do
        rplc="$rplc\\x0"
    done 
    msg2 'Stripping $srcdir'
    find ${pkgdir}/usr/lib/yade/* -type f -print0 | xargs -0 sed -i "s|${srcdir}/|${rplc}|g"
    # .py file should not contains \x0
    sed -i 's/\x0//g' ${pkgdir}/usr/lib/yade/py/yade/config.py
    
   # Fix manpage
   cd ${pkgdir}/usr/share/man
   mkdir man1
   mv yade* man1
}
