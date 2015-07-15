# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Adria Arrufat (archdria) <swiftscythe@gmail.com>


pkgname=ardentryst
pkgver=1.71
pkgrel=3
pkgdesc="An action/RPG sidescoller with a focus on story and character development"
arch=('any')
url="http://jordan.trudgett.com/"
license=('GPL3' 'CCPL')
depends=('python2-pygame')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname$pkgver.tar.gz
        $pkgname.sh)
md5sums=('eccdea0817ebb5996535834b842a5046'
         'f4d92279de96f55e200c0133d3bd5361')

package() {
  cd "$srcdir"/$pkgname$pkgver

  # install data
  install -m755 -d "$pkgdir"/usr/share/$pkgname
  cp -rf \
    {Base,Data,Fonts,Levels,Music,Sounds,COPYING*} \
    *.{py,txt,png,xml,dig} \
    "$pkgdir"/usr/share/$pkgname/

  # set permissions
  find "$pkgdir"/usr/share/$pkgname -type d -exec chmod 755 {} +
  find "$pkgdir"/usr/share/$pkgname -type f -exec chmod 644 {} +

  # install icon
  install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # isntall .desktop file
  install -Dm644 ${pkgname^a}.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # install launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
