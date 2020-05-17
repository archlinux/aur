# Maintainer: aggraef@gmail.com
pkgname=guidoar-git
pkgver=387.0327569
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
source=("$pkgname::git+https://github.com/grame-cncm/guidoar.git#branch=dev")
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
    # Fix up installation paths
    mv "$pkgdir/usr/local/include" "$pkgdir/usr/local/lib" "$pkgdir/usr"
    rmdir "$pkgdir/usr/local"
}
