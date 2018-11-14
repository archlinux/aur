# Maintainer: Alexej Magura <agm2819*gmail*>

pkgname=tkinfo
pkgver=2.11
pkgrel=1
pkgdesc="a graphical browser for files in the GNU hypertext 'info' format"
arch=(any)
url="http://math-www.uni-paderborn.de/~axel/$pkgname/"
license=(custom)
depends=(tk tcl sh)
source=("http://math-www.uni-paderborn.de/~axel/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=(609884b80a4c7ed4bb701de2da0abf67)

prepare()
{
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|/bin/sh|/usr/bin/sh|' $pkgname
  sed -n '6,16p; 30,44p' $pkgname > LICENSE
  sed -i '1d;3d; s/Version of TkInfo:/TkInfo v'$pkgver'/' LICENSE
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir"/usr/{bin,share/{man/man1,pixmaps,doc/"$pkgname"}}

  install -m755 "$pkgname" "$pkgdir"/usr/bin
  install -m644 -t "$pkgdir"/usr/share/doc/"$pkgname" README LICENSE
  #install -m644 README "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 TkInfo.xpm "$pkgdir"/usr/share/pixmaps
  install -m644 tkinfo.1 "$pkgdir"/usr/share/man/man1
}

# vim:set ts=2 sw=2 et:
