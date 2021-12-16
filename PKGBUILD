# Maintainer: Javier Fernández <WyRe12[at]gmail[dot]com>

pkgname=pixeled-ttf
pkgver=1.0
pkgrel=1
pkgdesc="Pixeled font from http://www.dafont.com"
arch=(any)
url="http://www.dafont.com/es/pixeled.font"
license=('custom:fontstruct')
depends=('fontconfig' 'xorg-font-utils' 'unzip')
provides=('ttf-font')
source=("$pkgname.zip::http://dl.dafont.com/dl/?f=pixeled")
noextract=("$pkgname.zip")
install=$pkgname.install
md5sums=('b8cea9e08d98d07d6225168037258d36')

prepare() {
  unzip -o -j -LL -qq $pkgname.zip -d $srcdir/$pkgname/
}

package() {
  
  # Installing font
  chmod 644 "$srcdir/$pkgname/"*.ttf
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname/"*.ttf "$pkgdir/usr/share/fonts/TTF/"

  # License
  cd $srcdir
  install -Dm644 "$srcdir/$pkgname/"license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
