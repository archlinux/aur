# maintainer: < aur \at semjonov \dot de >
# copyright: Bruce Nikkel < nikkel \at digitalforensics.ch >

pkgname="sfsimage"
pkgdesc="Script to manage squashfs forensic evidence containers."

pkgver=0.9
pkgrel=1

arch=('any')
url="https://www.digitalforensics.ch/sfsimage"
license=('custom')

depends=('dc3dd' 'squashfs-tools' 'pv')
makedepends=('awk')

provides=($pkgname)
conflicts=($pkgname)

source=("$url/$pkgname-$pkgver.tar")
sha256sums=('95efacb9c5cac7b404ba5943dbfbf9eb80057695182ab6b0d7a2e0ef3abdca3f')

build() {
  # write license file from copyright and warranty notice
  cd "$srcdir/"
  grep Copyright: sfsimage | tee NOWARRANTY
  awk '/NO WARRANTIES/{flag=1;next}/^\./{flag=0}flag' sfsimage.1 | tee -a NOWARRANTY
}

package() {
  cd "$srcdir/"
  install -Dm644 "NOWARRANTY" "$pkgdir/usr/share/licenses/$pkgname/NOWARRANTY"
  install -Dm755 "sfsimage"   "$pkgdir/usr/bin/sfsimage"
  install -Dm644 "sfsimage.1" "$pkgdir/usr/share/man/man1/sfsimage.1"
}
