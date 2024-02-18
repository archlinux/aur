# Maintainer: solaraquarion <shlomochoina@gmail.com>

pkgname=domterm-git
pkgver=3.2.0.r0.g460360c0
pkgrel=1
pkgdesc="Terminal emulator capable of display html and images from command output"
arch=('x86_64')
url=https://github.com/PerBothner/DomTerm
license=('BSD-3-Clause')
groups=()
conflicts=(qtdomterm)
makedepends=('git' 'vim' 'asciidoctor' 'zip' 'json-c' 'rust' 'jq' 'libsoup' 'atk' 'gtk3'
             'webkit2gtk' 'libappindicator-gtk3' 'java-openjfx')
depends=(qt5-webengine libwebsockets java-runtime webkit2gtk-4.1)
source=('git+https://github.com/PerBothner/DomTerm.git')
md5sums=('SKIP')

pkgver(){
  cd "$srcdir"/DomTerm
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cd "$srcdir"/DomTerm
    autoreconf -vfi
    ./configure --with-qt --with-libwebsockets --with-javafx --with-wry --prefix=/usr --libexecdir=/usr/lib
    make V=1
}

package() {
    cd "$srcdir"/DomTerm
    make install DESTDIR="$pkgdir"
    rm -rf "$pkgdir"//usr/share/terminfo/d/
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -Dm755 COPYING $pkgdir/usr/share/licenses/$pkgname
}
