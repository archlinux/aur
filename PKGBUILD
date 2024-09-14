pkgname=supermarioworld
_pkgname=SuperMarioWorld
pkgver=1.0.1
pkgrel=1
pkgdesc="Super Mario World powered by smw"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/supermarioworld"
license=('GPL')
depends=('smw-bin' 'yad' 'python')
makedepends=('unzip')
sha256sums=('b37c3083ffb99bb36d1fb2cb74c8010fdcfe64c46a9c5cac7ab249c0633c1525')
source=("$url/-/archive/$pkgver/supermarioworld-$pkgver.tar.bz2")
 
package() {
   install -dm755 "$pkgdir/usr/share/games/$_pkgname"
   install -dm755 "$pkgdir/usr/share/pixmaps"
   install -dm755 "$pkgdir/usr/bin"
   
   for dir in supermarioworld-*/ ; do mv "${dir}" "$_pkgname" ;done  
   cp -r "$srcdir/$_pkgname/smw.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
   cp -r "$srcdir/$_pkgname/." "$pkgdir/usr/share/games/$_pkgname"

   #Binary
   install -Dm755 "$srcdir/$_pkgname/supermarioworld" "$pkgdir/usr/bin"

   # Desktop Entry
   install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
   sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
