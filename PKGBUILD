# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=mp4joiner
pkgver=3.8
pkgrel=2
pkgdesc="A collection of tools to manipulate MP4 files"
arch=('x86_64')
url="https://www.mp4joiner.org/"
license=('GPL')
depends=('gpac' 'wxsvg')
source=("https://downloads.sourceforge.net/mp4joiner/MP4Tools-$pkgver.tar.bz2"
        'mp4joiner.desktop'
        'mp4splitter.desktop')
sha256sums=('6a64d4c02b84affb6b6e1f17aaca78a41d319576b7f428b50b55a6ba2ce64b3e'
            'dc8dcb73b65c9ba34ff03a1a7a26034f353d8904aa5c54a398a3668b058cb867'
            '54bc415026a90c22a3a4e0840ca0dad5e43d0f1ab5dcac7c5eb9a4503454137b')

build() {
  cd MP4Tools-$pkgver
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-gtk3
  make
}

package() {
  cd MP4Tools-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../mp4joiner.desktop "$pkgdir/usr/share/applications/mp4joiner.desktop"
  install -Dm644 ../mp4splitter.desktop "$pkgdir/usr/share/applications/mp4splitter.desktop"
  install -Dm644 resources/mp4joiner.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/mp4joiner.png"
  install -Dm644 resources/mp4splitter.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/mp4splitter.png"
}
