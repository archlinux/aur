# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Kevin Puertas <kevinpr at jkanetwork dot com>
# Contributor: St.kai <St.kai@live.cn>
# Contributor: ssysmso sending updated PKGBUILD
# Contributor: Christoph Korn <christoph.korn at posteo dot de>

pkgname=beebeep
pkgver=5.8.4
pkgrel=4
pkgdesc='Secure LAN messenger and file sender'
arch=('x86_64')
url='https://www.beebeep.net/'
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-code-$pkgver.zip"
        'beebeep.appdata.xml')
sha256sums=('43e65a9d5249385fde782907d0cc3e26d6dd435bb623bcc0f93499055988f04c'
            '05c6add5d33f4e429b213f25d46053611f838fdd709c593af211133c96788ca7')
 
build() {
  cd $pkgname-code-r*
  qmake-qt5
  make
}
 
package(){
  cd $pkgname-code-r*
  install -Dm755 test/beebeep "$pkgdir/usr/bin/beebeep"
  install -Dm644 test/lib*.so -t "$pkgdir/usr/lib/beebeep/"
  install -Dm644 locale/beebeep_*.qm -t "$pkgdir/usr/share/beebeep/"
  install -Dm644 src/images/beebeep.png "$pkgdir/usr/share/beebeep/beebeep.png"
  install -Dm644 misc/beep.wav "$pkgdir/usr/share/beebeep/beep.wav"
  install -Dm644 scripts/debian_amd64/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../beebeep.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}
