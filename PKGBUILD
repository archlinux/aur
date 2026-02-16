# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=openloops
pkgver=2.1.5
pkgrel=1
pkgdesc="A particle physics package for the fast numerical evaluation of tree and one-loop matrix elements."
arch=('x86_64' 'i686')
url="http://openloops.hepforge.org"
license=('GPL3')
depends=('gcc-fortran' 'scons')
source=('git+https://gitlab.com/openloops/OpenLoops.git#branch=public_beta')
md5sums=('SKIP')

build() {
	cd "$srcdir/OpenLoops"
}

package() {
        cd "$srcdir/OpenLoops"
        mkdir -p $pkgdir/usr/lib/openloops/
        cp -rp * $pkgdir/usr/lib/openloops/

        cd $pkgdir/usr/lib/openloops/
        rm ./scons
        ln -s /usr/bin/scons
        scons
        ./openloops libinstall ppllj pptt ppvv ppvj
        
        rm -rf authors.txt COPYING examples include ltest.dat process_obj/ process_src/ README scons-local .sconsign.dblite
}
