# Maintainer: Sergey Khorev <sergey.khorev@gmail.com>
pkgname=fricas
pkgver=1.2.5
pkgrel=1
pkgdesc="An advanced computer algebra system"
arch=('i686' 'x86_64')
license=('custom')
depends=('gawk' 'libxpm')
makedepends=('sbcl' 'libx11' 'texlive-core')
options=('!strip' '!emptydirs')
url="http://fricas.sourceforge.net"
source=("http://downloads.sourceforge.net/project/fricas/fricas/${pkgver}/fricas-${pkgver}-full.tar.bz2" "http://fricas.sourceforge.net/copyright.txt")
md5sums=('9320a8f13a5fe5fee17fac666fb7fed3' '147828bf0b62e1f7d0c600a1c377669c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --with-lisp=sbcl
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
    install -D -m644 debian/fricas.desktop $pkgdir/usr/share/applications/fricas.desktop
    install -D -m644 debian/fricas.xpm $pkgdir/usr/share/pixmaps/fricas.xpm
    install -D -m644 "$srcdir/copyright.txt" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
