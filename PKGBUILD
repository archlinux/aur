# Maintainer: Thor M. K. Høgås <thor alfakrøll roht dott no>
# Contributor: AndreasBWagner <AndreasBWagner@pointfree.net>
# Contributor: Mark Taylor <skymt0@gmail.com>
pkgname=programmers-dvorak
pkgver=1.2
pkgrel=5
pkgdesc="Variant of the Dvorak keyboard layout designed for programmers"
arch=(any)
url="http://www.kaufmann.no/roland/dvorak/"
license=('custom')
install=programmers-dvorak.install
depends=('kbd' 'libxslt')
makedepends=('coreutils')
source=("http://www.kaufmann.no/downloads/linux/kbddvp-1_2_1-src-linux.tgz"
	"http://www.kaufmann.no/downloads/linux/dvp-1_2_1.map.gz"
	"LICENSE")
noextract=("http://www.kaufmann.no/downloads/linux/dvp-1_2_1.map.gz")
md5sums=('6d7797f1514be62cb01fbdf3a7e785a4'
         '8cde9c8f6b4de6c7c2ebb27589a5116e'
         '48ebb9016f6138334194103caba4483f')

package() {
  cd $srcdir/kbddvp-$pkgver
  mkdir -p $pkgdir/usr/share/X11/xkb/{symbols,types}
  chmod +x *.sh
  ./dvp.install.sh $pkgdir/usr/share/X11/xkb
  mkdir -p $pkgdir/usr/share/$pkgname
  install -Dm644 $srcdir/dvp-1_2_1.map.gz $pkgdir/usr/share/kbd/keymaps/i386/dvorak/dvp.map.gz
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 *.sh $pkgdir/usr/share/$pkgname
}

