# Maintainer: solaraquarion <shlomochoina@gmail.com>

pkgname=domterm-git
pkgver=1.0.r496.g4bf07c7
pkgrel=1
pkgdesc="Terminal emulator capable of display html and images from command output"
arch=('x86_64')
url=https://github.com/PerBothner/DomTerm
license=('BSD')
groups=()
conflicts=(qtdomterm)
makedepends=('git' 'vim' 'asciidoctor')
depends=(json-c file qt5-webengine qt5-webchannel libwebsockets)
source=('git+https://github.com/PerBothner/DomTerm.git')
md5sums=('SKIP')

pkgver(){
  cd "$srcdir"/DomTerm
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cd "$srcdir"/DomTerm
    autoreconf -vfi
    ./configure --with-qtwebengine --with-libwebsockets --prefix=/usr
    make
}

package() {
    cd "$srcdir"/DomTerm
    make install DESTDIR="$pkgdir"
    install -m 755 "$srcdir"/DomTerm/bin/{h,img,svg}cat "$pkgdir"/usr/bin
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -Dm755 COPYING $pkgdir/usr/share/licenses/$pkgname
}
