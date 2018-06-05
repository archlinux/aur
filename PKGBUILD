# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=polyphone
pkgver=1.9
pkgrel=3
pkgdesc="Graphical user interface for editing sf2 and sfz files"
arch=('i686' 'x86_64')
url="http://polyphone-soundfonts.com/"
license=('GPL3')
depends=('libvorbis' 'qt5-svg' 'portaudio' 'stk')
makedepends=('rtmidi')
source=("https://github.com/davy7125/polyphone/raw/master/versions/polyphone-1.9-src.zip"
        "$pkgname-config-cpp.patch"
        "$pkgname.desktop"
        "$pkgname.mime")
changelog='ChangeLog'
sha256sums=('c034cd09084439a57e07a526a9674800668536add7609f4e4ab610f63b0538ca'
            'cefd4c29d4767be54e2a45d584542106888caf5d7fd4a73307b08e4c9be32b93'
            '280f626c53aff264a2c735da4478a769b6b39440679360d775c9b5e549b890aa'
            '6456f6f458283054361b6e0bff6a0a6335201798984b17c259fe343d559de996')

prepare() {
  cd "$srcdir/trunk"
  # https://github.com/davy7125/polyphone/issues/33
  patch -p1 -i "$srcdir/$pkgname-config-cpp.patch"
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
