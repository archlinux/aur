# Maintainer: solaraquarion <shlomochoina@gmail.com>

pkgname=domterm-git
pkgver=1.0.r334.g404b06a
pkgrel=1
pkgdesc="Terminal emulator capable of display html and images from command output"
arch=('any')
url=https://github.com/PerBothner/DomTerm
license=('BSD')
groups=()
conflicts=(qtdomterm)
makedepends=('git' 'vim' 'asciidoctor')
depends=(json-c qt5-webengine qt5-webchannel libwebsockets)
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
}
