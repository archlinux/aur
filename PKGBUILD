# Maintainer:  dwayne <dwayne@oboj.net>

pkgname=rssdler
pkgver=0.4.2
pkgrel=1
pkgdesc="Utility to automatically download RSS enclosures"
arch=('any')
url="http://code.google.com/p/rssdler/"
license=('GPL2')
depends=('python2-feedparser')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver-fix.diff
        config.txt)
md5sums=('2f0aef5611bc1231928b861f717953eb'
         '2317d4526f1d0e35fbdb0fb48709e058'
         'f9bf928e97b4fd996e1c5854990adcad')

package() {
  cd "$srcdir/$pkgname${pkgver//\./}"
  patch -Np0 -i ../$pkgname-$pkgver-fix.diff
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 ../config.txt "$pkgdir/usr/share/$pkgname/config.txt"
  install -Dm644 userFunctions.py "$pkgdir/usr/share/$pkgname/postDownloadFunctions.py"
}

# vim:set ts=2 sw=2 et:
