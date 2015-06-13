# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=incursion
pkgver=0.6.9H4L
#pkgver=0.6.5BL  # if H4L does not work for you
pkgrel=1
pkgdesc="A freeware roguelike with very detailed characters."
arch=(i686 x86_64)
url="http://www.incursion-roguelike.net/"
license=('unknown')  # closed source, none given
depends=('gcc-libs' 'libxau' 'libxfixes' 'libxrender' 'libxcursor' 'libxpm')
source=("http://www.incursion-roguelike.org/Incursion%20$pkgver.tar.gz")
md5sums=('32073f76643b3046dde068cbb6330860')

if [[ $CARCH == x86_64 ]]; then
  depends=('lib32-gcc-libs' 'lib32-libxau' 'lib32-libxfixes' \
           'lib32-libxpm' 'lib32-libxrender' 'lib32-libxcursor')
fi

package() {
  # for now, it needs /opt
  cd "$srcdir/Incursion $pkgver"
  install -d "$pkgdir/opt/$pkgname"
  install -d "$pkgdir/usr/bin"
  # should be using 'install', but so many files
  chmod -R -x *
  chmod    +x incursion 
  chmod  0775 logs mod save
  chmod  0664 Incursion.cfg keyboard.dat Options.Dat
  cp -ra ./ "$pkgdir/opt/$pkgname/"
  chown -R root:games "$pkgdir/opt/$pkgname/"
  chown    root:root  "$pkgdir/opt/$pkgname/incursion"

  # launch link
  ln -s /opt/incursion/incursion "$pkgdir/usr/bin/incursion"
}

