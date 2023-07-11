# Maintainer: Sergey Khorev <sergey.khorev@gmail.com>
pkgname=fricas
pkgver=1.3.9
pkgrel=4
pkgdesc="An advanced computer algebra system"
arch=('i686' 'x86_64')
license=('custom')
depends=('gawk' 'libxpm')
makedepends=('sbcl' 'libx11' 'texlive-core')
options=('!strip' '!emptydirs')
url="https://fricas.github.io"
source=("https://github.com/fricas/fricas/releases/download/$pkgver/fricas-$pkgver-full.tar.bz2" "copyright.txt")
md5sums=('02e4511358e15caabb5567f078071f32' 'b5fcffe7f1de5dbbf77b4ed24b19b7c2')

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
