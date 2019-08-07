# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xmedcon-extra
pkgver=1.2.1
pkgrel=1
pkgdesc="Some tools and ressources for Xmedcon"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('xmedcon')
source=(https://sourceforge.net/projects/xmedcon/files/XMedCon-Extra/$pkgver/xmedcon-extra-$pkgver.zip)
sha256sums=('12f61b9b079ffe0c3a1c17f009f3aa58cae41bbbec1f50d16b11c75b3cd36eac')

build() {
  cd $pkgname/source
  for _exec in get1gif getecatdb makegray testit ctbody2stack ctskull2stack imtkconv
  do
    make ${_exec}
  done
}

package() {
  cd $pkgname/source
  for _exec in get1gif getecatdb makegray testit ctbody2stack ctskull2stack imtkconv
  do
    install -Dm755 ${_exec%.c} "$pkgdir"/usr/bin/${_exec%.c}
  done
  cd ..
  install -d "$pkgdir"/usr/share/xmedcon/
  cp -r luts "$pkgdir"/usr/share/xmedcon/
}
