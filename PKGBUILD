# Maintainer: Oliver Mangold <o dot mangold at gmail dot com>

pkgname=qtdomterm
pkgver=0.72
pkgrel=1
pkgdesc="Terminal emulator capable of display html and images from command output"
arch=('any')
url=ttps://github.com/PerBothner/DomTerm
license=('BSD')
groups=()
depends=(json-c qt5-webengine qt5-webchannel)
source=('git+https://github.com/PerBothner/DomTerm.git#commit=b53ffa6410f381da4067715b1dc11a2b58e35985' qtdomterm.desktop)
md5sums=(SKIP 'd35f7bd80b0c6cda9da182a019914d9a')

build() {
    cd "$srcdir"/DomTerm
    autoreconf
    ./configure --disable-pty --with-qtwebengine --without-java --without-libwebsockets --prefix=/usr
    make
}

package() {
    cd "$srcdir"/DomTerm
    make install DESTDIR="$pkgdir"
    install -m 755 "$srcdir"/DomTerm/bin/{h,img,svg}cat "$pkgdir"/usr/bin
    install -m 755 -d "$pkgdir"/usr/share/applications/
    install -m 644 "$srcdir"/qtdomterm.desktop "$pkgdir"/usr/share/applications/qtdomterm.desktop
}
