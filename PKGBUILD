# Maintainer: aggraef@gmail.com
pkgname=midisharelight-git
pkgver=1647.f8a17cc
pkgrel=1
pkgdesc="light version of the MidiShare library (git version)"
arch=('x86_64' 'i686')
url="http://midishare.sourceforge.net/"
license=('LGPL')
makedepends=('cmake')
options=('strip' 'staticlibs')
provides=('midisharelight')
conflicts=('midisharelight')
source=("$pkgname::git+git://git.code.sf.net/p/midishare/code#branch=dev")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$pkgname/midisharelight/cmake"
    cmake -G "Unix Makefiles"
    make
}

# The software doesn't honor CMAKE_INSTALL_PREFIX, so we move things over to
# /usr by hand.
package() {
    cd "$srcdir/$pkgname/midisharelight/cmake"
    make install DESTDIR="$pkgdir"
    cd "$pkgdir/usr"
    mv local/* . && rmdir local
}
