# Maintainer: Sergey Khorev <sergey.khorev@gmail.com>
pkgname=fricas
pkgver=1.3.8
pkgrel=1
pkgdesc="An advanced computer algebra system"
arch=('i686' 'x86_64')
license=('custom')
depends=('gawk' 'libxpm')
makedepends=('sbcl' 'libx11' 'texlive-core')
options=('!strip' '!emptydirs')
url="http://fricas.sourceforge.net"
source=("http://downloads.sourceforge.net/project/fricas/fricas/${pkgver}/fricas-${pkgver}-full.tar.bz2" "http://fricas.sourceforge.net/copyright.txt")
md5sums=('504b431c39e498527e6f9c739c973488' '147828bf0b62e1f7d0c600a1c377669c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --with-lisp='sbcl --control-stack-size 512 --dynamic-space-size 6000'
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
    install -D -m644 "$srcdir/copyright.txt" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
