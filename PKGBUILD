# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xmedcon-extra
pkgver=1.2.0
pkgrel=1
pkgdesc="Some tools and ressources for Xmedcon"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('xmedcon')
source=(https://sourceforge.net/projects/xmedcon/files/XMedCon-Extra/$pkgver/xmedcon-extra-$pkgver.zip)
sha256sums=('eecc5093e11fc7b5e07fa5581af82ede334d508155c11b82523c25be0178dcfc')

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
