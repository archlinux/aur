# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Xavier de Labouret <arch@2-lab.net>

pkgname=xlogo
pkgver=0.9.93
pkgrel=2
pkgdesc='Logo interpreter written in Java, to teach programming to children with a graphical turtle'
arch=('x86_64' 'i686')
url='http://xlogo.tuxfamily.org/'
license=('GPL')
depends=('java-runtime')
makedepends=('setconf' 'gendesk') 
source=("http://downloads.tuxfamily.org/xlogo/common/oldies/xlogo-$pkgver.jar"
        'xlogo.png'
        'xlogo.sh')
sha256sums=('044e7df8c7eecc5e04852a1eefdc22b7b45cff20d6554e98705ee6eb3c69ff10'
            '024454aced2a5c5d6d3cde1693c103472c1f24c94007566baecb09587e5bbd83'
            '40e191a72a4a4a8b0353224349a4d2509214d6d7d4170a1a52b838580939af6d')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --exec "java -jar /usr/share/xlogo/xlogo-$pkgver.jar" \
    --name XLogo --custom 'Path=/usr/share/xlogo'
  setconf xlogo.sh VERSION "$pkgver"
}

package() {
  install -Dm644 "xlogo-$pkgver.jar" \
    "$pkgdir/usr/share/$pkgname/xlogo-$pkgver.jar"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/xlogo.png"
  install -Dm755 xlogo.sh "$pkgdir/usr/bin/xlogo-lang"
}

# vim:set ts=2 sw=2 et:
