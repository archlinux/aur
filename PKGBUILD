# Maintainer: solaraquarion <shlomochoina@gmail.com>

pkgname=domterm-git
pkgver=2.9.4.r95.g29efa6e
pkgrel=1
pkgdesc="Terminal emulator capable of display html and images from command output"
arch=('x86_64')
url=https://github.com/PerBothner/DomTerm
license=('BSD')
groups=()
conflicts=(qtdomterm)
makedepends=('git' 'vim' 'asciidoctor' 'zip' 'json-c' 'rust' 'jq' 'libsoup' 'atk' 'gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'java-openjfx')
depends=(qt5-webengine libwebsockets java-runtime webkit2gtk)
source=('git+https://github.com/PerBothner/DomTerm.git')
md5sums=('SKIP')

pkgver(){
  cd "$srcdir"/DomTerm
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cd "$srcdir"/DomTerm
    autoreconf -vfi
    ./configure --with-qt --with-libwebsockets --with-javafx --with-wry --prefix=/usr
    make V=1
}

package() {
    cd "$srcdir"/DomTerm
    make install DESTDIR="$pkgdir"
    install -m 755 "$srcdir"/DomTerm/bin/{h,img,svg}cat "$pkgdir"/usr/bin
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -Dm755 COPYING $pkgdir/usr/share/licenses/$pkgname
}
