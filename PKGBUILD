# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xmedcon-extra
pkgver=1.1.3
pkgrel=1
pkgdesc="Some tools and ressources for Xmedcon"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('xmedcon')
source=(https://sourceforge.net/projects/xmedcon/files/XMedCon-Extra/$pkgver/xmedcon-extra-$pkgver.zip)
sha256sums=('85fe7e903a72522e2850d1ec59d283dd036a8ecdea22ba4a3876c471df521469')

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
