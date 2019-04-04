# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=openloops
pkgver=2.0.0
pkgrel=1
pkgdesc="A particle physics package for the fast numerical evaluation of tree and one-loop matrix elements."
arch=('x86_64' 'i686')
url="http://openloops.hepforge.org"
license=('GPL3')
depends=('gcc-fortran' 'scons' 'python2')
source=(http://www.hepforge.org/archive/openloops/OpenLoops-$pkgver.tar.gz)
md5sums=('af28b4d10b8d51a34f5becc766e5913f')

build() {
	cd "$srcdir/OpenLoops-$pkgver"
}

package() {
        cd "$srcdir/OpenLoops-$pkgver"
        mkdir -p $pkgdir/usr/lib/openloops/
        cp -rp * $pkgdir/usr/lib/openloops/

        cd $pkgdir/usr/lib/openloops/
        rm ./scons
        ln -s /usr/bin/scons
        scons
        ./openloops libinstall ppllj pptt ppvv ppvj
        
        rm -rf authors.txt COPYING examples include ltest.dat process_obj/ process_src/ README scons-local .sconsign.dblite
}
