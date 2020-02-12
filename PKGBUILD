# maintainer: < aur \at semjonov \dot de >
# author: Bruce Nikkel < nikkel \at digitalforensics.ch >

pkgname="sfsimage"
pkgdesc="Script to manage squashfs forensic evidence containers."

pkgver=1.0
pkgrel=1

arch=('any')
url="https://www.digitalforensics.ch/sfsimage"
license=('MIT')

depends=('dc3dd' 'squashfs-tools' 'pv')
makedepends=('awk')

provides=($pkgname)
conflicts=($pkgname)

source=("$url/$pkgname-$pkgver.tar")
sha256sums=('b427c7a35b59848e6811529ca3ae45f0ebb4ab64b9c199ad5aba1a6e96881a93')

build() {
  # copy license file from manual
  cd "$srcdir/"
  awk '/^\.SH MIT License/ { print $2, $3; flag=1; next } /^\./ { flag=0 } flag { print }' sfsimage.1 > LICENSE
}

package() {
  cd "$srcdir/"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "sfsimage"   "$pkgdir/usr/bin/sfsimage"
  install -Dm644 "sfsimage.1" "$pkgdir/usr/share/man/man1/sfsimage.1"
}
