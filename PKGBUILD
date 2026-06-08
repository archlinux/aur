# Maintainer: Frank Siegert <frank.siegert@cern.ch>
pkgname=yoda-git
pkgver=2.1.3.r5.gc54bdec7
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes -- latest build from git repo."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
makedepends=('cython')
conflicts=('yoda')
provides=('yoda')
replaces=('yoda-hg')
source=('git+https://gitlab.com/hepcedar/yoda.git')
md5sums=('SKIP')

package() {
	cd "$srcdir/yoda"
        autoreconf -i
	./configure --prefix=/usr --sysconfdir=/etc
	make DESTDIR="$pkgdir/" install
}

pkgver() {
	cd "$srcdir/yoda"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/yoda\.//g'
}
