# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=sheeplifter
pkgver=2
pkgrel=5
pkgdesc="Control a wolf in a spaceship and abduct sheep in 3D (arcade game)"
url="http://code.google.com/p/sheeplifter/"
license=('BSD')
arch=('x86_64' 'i686')
depends=('java-runtime' 'lwjgl')
makedepends=('gendesk')
source=('http://sheeplifter.googlecode.com/files/Sheeplifter_GC_2.zip'
        'sheeplifter.png'
        'run.sh')
sha256sums=('0d35701e538b8a6c61e6940dae63d222c6df799e60958bdfd2bd0199aba5c527'
            '15c09faf8ee47847dda8071853639663bd09b8fcc638ce599398d7beb103e5c7'
            'ca257e05e4849cc215120923d656f6e43fdea7cc280009fc92b02c902db52f63')

build() {
  cd "$srcdir"
  gendesk -n
  cd "$pkgname"
  tail -24 readme.txt > license.txt
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/"{pixmaps,applications,sheeplifter} \
    "$pkgdir/usr/bin"
  cp -R jme "$pkgdir/usr/share/sheeplifter"
  cp -R jorbis "$pkgdir/usr/share/sheeplifter"
  find $pkgdir/usr/share/sheeplifter -type f -exec chmod 644 {} \;
  install -Dm644 readme.txt sheeplifter.jar $pkgdir/usr/share/sheeplifter
  install -Dm755 run_game_linux.sh $pkgdir/usr/share/sheeplifter
  install -Dm644 license.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -Dm755 ../run.sh "$pkgdir/usr/bin/sheeplifter"
  install -Dm644 ../sheeplifter.png $pkgdir/usr/share/pixmaps
  install -Dm644 ../sheeplifter.desktop $pkgdir/usr/share/applications
}

# vim:set ts=2 sw=2 et:
