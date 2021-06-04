# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: BenObiWan <benobiwan @t gmail dot com>

pkgname=zelda-xd2
pkgver=1.1.2
pkgrel=1
epoch=
pkgdesc='The Legend of Zelda XD2: Mercuris Chess - parodic fangame'
arch=('any')
url='https://www.solarus-games.org/'
license=('GPL3' 'custom')
depends=('solarus>=1.6.0')
makedepends=('cmake' 'zip')
changelog="$pkgname.changelog"
source=("https://gitlab.com/solarus-games/zelda-xd2-mercuris-chess/-/archive/v$pkgver/zelda-xd2-mercuris-chess-v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.png")
b2sums=('d7d84d9d5b5b5a77f539a9b09e84f307cedae85b7a8342806954eae99f32a414ab75beb1d3b7761f29641f6356fe4b83ca7d65554ce5f80fbf3702d8c9f1d6d6'
        'b0a713910884fa4e075f0c14a80b80ec32e614e361bf3bde31dab8a6ed8e277599aec51408c50320afc33544940a8d0d9d03793ddef7fdf7a683aaa3b3cb9c7f'
        '610fa6e4499b863503d6cd29608dcd71ac936bba7124ddbabcf00970c27d27c9770de89e26abb375d5eea7f13e555d16fc9a4728abd8c32b7c6c547a580b49d6')

build() {
  cd "zelda-xd2-mercuris-chess-v$pkgver" 
  cmake -DCMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"


  cd "zelda-xd2-mercuris-chess-v$pkgver" 
  make DESTDIR="$pkgdir/" install
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

