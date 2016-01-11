# Maintainer: aggraef@gmail.com
pkgname=guidoar-git
pkgver=351.7e91eda
pkgrel=1
pkgdesc="a library to browse, transform and manipulate Guido scores (git version)"
arch=('x86_64' 'i686')
url="http://guidolib.sourceforge.net/"
license=('MPL')
# needed for the MIDI export functionality
depends=('midisharelight-git')
makedepends=('cmake')
provides=('guidoar')
conflicts=('guidoar')
source=("$pkgname::git+git://git.code.sf.net/p/guidolib/guidoar#branch=dev")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$pkgname/build"
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    make install DESTDIR="$pkgdir"
    # Fix up the installation path (upstream uses cmake, but no
    # CMAKE_INSTALL_PREFIX)
    mv "$pkgdir/usr/local/include" "$pkgdir/usr/local/lib" "$pkgdir/usr"
    rmdir "$pkgdir/usr/local"
}
