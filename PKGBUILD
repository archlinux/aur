# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=sheeplifter
pkgver=2
pkgrel=7
pkgdesc='Control a wolf in a spaceship and abduct sheep in 3D (arcade game)'
url='http://code.google.com/p/sheeplifter/'
license=('BSD')
arch=('x86_64' 'i686')
depends=('java-runtime' 'lwjgl2')
makedepends=('gendesk')
source=('https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/sheeplifter/Sheeplifter_GC_2.zip'
        'sheeplifter.png'
        'run.sh')
sha256sums=('0d35701e538b8a6c61e6940dae63d222c6df799e60958bdfd2bd0199aba5c527'
            '15c09faf8ee47847dda8071853639663bd09b8fcc638ce599398d7beb103e5c7'
            '94e85a8d3a5634f23e4cc2f87f275991cef6c4e760de079586a6c678954ec796')

prepare() {
  cd "$pkgname"

  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc"
  tail -24 readme.txt > COPYING
}

package() {
  cd "$pkgname"

  install -d "$pkgdir/usr/share/"{pixmaps,applications,sheeplifter} "$pkgdir/usr/bin"
  cp -R jme "$pkgdir/usr/share/sheeplifter"
  cp -R jorbis "$pkgdir/usr/share/sheeplifter"
  find "$pkgdir/usr/share/sheeplifter" -type f -exec chmod 644 {} \;
  install -Dm644 readme.txt sheeplifter.jar "$pkgdir/usr/share/sheeplifter"
  install -Dm755 run_game_linux.sh "$pkgdir/usr/share/sheeplifter"
  install -Dm644 sheeplifter.desktop "$pkgdir/usr/share/applications"
  install -Dm644 ../sheeplifter.png "$pkgdir/usr/share/pixmaps"
  install -Dm755 ../run.sh "$pkgdir/usr/bin/sheeplifter"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
