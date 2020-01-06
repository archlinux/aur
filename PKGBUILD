# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Xavier de Labouret <arch@2-lab.net>

pkgname=xlogo
pkgver=0.9.96pre
pkgrel=1
pkgdesc='Logo interpreter written in Java, to teach programming to children with a graphical turtle'
arch=('x86_64' 'i686')
url='http://xlogo.tuxfamily.org/'
license=('GPL')
depends=('java-runtime')
makedepends=('setconf' 'gendesk') 
source=("https://downloads.tuxfamily.org/xlogo/common/xlogo.jar"
        'xlogo.png'
        'xlogo.sh')
sha256sums=('41f4ed29e173b44f3fc90a36c31b31027216fbe0bd777cc70448bb5894ad48e0'
            '024454aced2a5c5d6d3cde1693c103472c1f24c94007566baecb09587e5bbd83'
            '07d323190839f08d86b91a62399da2143212a3930aa20b54bdd63842d44e55c9')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --exec "java -jar /usr/share/xlogo/xlogo-$pkgver.jar" \
    --name XLogo --custom 'Path=/usr/share/xlogo'
  setconf xlogo.sh VERSION "$pkgver"
}

package() {
  install -Dm644 "xlogo.jar" \
    "$pkgdir/usr/share/$pkgname/xlogo.jar"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/xlogo.png"
  install -Dm755 xlogo.sh "$pkgdir/usr/bin/xlogo-lang"
}

# vim:set ts=2 sw=2 et:
