# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=polyphone
pkgver=1.6
pkgrel=2
pkgdesc="Graphical user interface for editing sf2 and sfz files"
arch=('i686' 'x86_64')
url="http://www.polyphone.fr/"
license=('GPL')
depends=('desktop-file-utils' 'qt5-svg' 'portaudio' 'shared-mime-info')
makedepends=('gendesk')
provides=(polyphone)
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname%20releases/$pkgver/$pkgname-$pkgver-src.zip"
        "$pkgname.desktop"
        "$pkgname.mime")
install="$pkgname.install"
md5sums=('c9ddaebbd865bbb2ea79f6d2334653e5'
         'c796f82cd0ab742741de5c607cd87169'
         'f0808717b27757c80b508f6114a535ce')

prepare() {
  cd "$srcdir/trunk"
  sed -i \
    -e 's/#DEFINES += USE_LOCAL_LIBRARIES/DEFINES += USE_LOCAL_LIBRARIES/g' \
    -e 's/__LINUX_ALSASEQ__/__LINUX_ALSA__ __UNIX_JACK__/g' \
    polyphone.pro
}

build() {
  cd "$srcdir/trunk"
  qmake
  make
}

package() {
  cd "$srcdir/trunk"
  install -D RELEASE/polyphone "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ressources/polyphone.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.mime" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}
