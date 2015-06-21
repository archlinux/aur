# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: mpie <michael.kyne-phillips1@ntlworld.com>

pkgname=angrydd
pkgver=1.0.1
pkgrel=6
pkgdesc='"Angry, Drunken Dwarves" is a classic "falling blocks" puzzle game'
arch=('any')
url="http://www.sacredchao.net/~piman/$pkgname/"
license=('GPL' 'custom')
depends=('python2-pygame>=1.6.2' 'python2-numpy')
[ "$CARCH" = "i686" ] && optdepends=('psyco: improved loading times')
source=($url/$pkgname-$pkgver.tar.gz \
	$pkgname.desktop
        LICENSE)
md5sums=('3b0f9771eaae3ffb23d13576a54075e9'
         '4e26bb276083c699df425770e0fc451b'
         '04f141a60ab1c9aeef6341227618f39d')

build() {
  cd $pkgname-$pkgver

  make PREFIX=/usr DESTDIR="$pkgdir" TO=share/angrydd install

  sed -i -e "s|env python$|env python2|" ${pkgdir}/usr/share/angrydd/angrydd.py

  mv -f "$pkgdir"/usr/games/ "$pkgdir"/usr/bin/

  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
