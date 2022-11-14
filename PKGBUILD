# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Kaos < gianlucaatlas at gmail dot com >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Matthew Sharpe <matt.sharpe@gmail.com>

pkgname=ophcrack
pkgver=3.8.0
pkgrel=4
pkgdesc="Windows password cracker based on rainbow tables"
arch=('x86_64')
url="http://ophcrack.sourceforge.net"
license=('GPL')
depends=('qt5-charts')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2
        ophcrack.desktop)
md5sums=('d4449e15f65b1f0f82abfd963ceff452'
         '664599c4fd7fd210e6c421459f60e20d')
sha256sums=('048a6df57983a3a5a31ac7c4ec12df16aa49e652a29676d93d4ef959d50aeee0'
            '1b3731fcb835c1ec26518b22e2c78c2955f3a079d4ce7a718ebc896c07653a0c')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --enable-gui --enable-graph

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/ophcrack.desktop \
    "$pkgdir"/usr/share/applications/ophcrack.desktop
  install -Dm644 src/gui/pixmaps/os.xpm \
    "$pkgdir"/usr/share/$pkgname/pixmaps/os.xpm
}
