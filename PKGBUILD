# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=openloops
pkgver=1.3.1
pkgrel=3
pkgdesc="A particle physics package for the fast numerical evaluation of tree and one-loop matrix elements."
arch=('x86_64' 'i686')
url="http://openloops.hepforge.org"
license=('GPL3')
depends=('gcc-fortran' 'scons' 'python2')
source=(http://www.hepforge.org/archive/openloops/OpenLoops-$pkgver.tar.gz)
md5sums=('86e950848827b34b4abb28024ff36f25')

build() {
	cd "$srcdir/OpenLoops-$pkgver"
        sed -i -e's/install_path = os.getcwd()/install_path = "\/usr\/lib\/openloops"/g' SConstruct
        rm ./scons
        ln -s /usr/bin/scons
        scons
        ./openloops libinstall ppll ppllj ppln pptt ppww ppzw ppzz ppaa ppaj
}

package() {
	cd "$srcdir/OpenLoops-$pkgver"
        mkdir -p $pkgdir/usr/lib/openloops/
	cp -rp lib proclib $pkgdir/usr/lib/openloops/

        # so far necessary for building further process libraries by the user:
	cp -rp lib_src openloops pyol SConstruct scons $pkgdir/usr/lib/openloops/
}
