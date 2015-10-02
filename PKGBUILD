# Maintainer: Pedro Pereira (pedrogabriel AT dcc DOT ufmg DOT br)
# Contributors: Sietse van der Molen, Henrik Nymann Jensen 
# Contributors: Alexandre (pums974 AT gmail DOT com )

pkgname=schedtoold
pkgver=0.3
pkgrel=9
pkgdesc="Simple daemon to renice/nice and change priorities of processes while running them."
depends=('bash' 'schedtool')
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
source=(http://www.darav.de/$pkgname-$pkgver.tar.bz2 \
	schedtoold.patch schedtoold.conf schedtoold schedtoold.service utils.patch
)
url="http://www.darav.de/schedtoold.html"
md5sums=('c8f1d73c0f0d0b3dba005d2853f2cfa4'
         'b449800d8f99d6acb83b2255eaed6166'
         '2f095a0e26a341c99e0425ce58dd3b90'
         'b50e8e0580e68bc076216b9cb663bb76'
         'd32da7c1fa24a4a9baf7802db088a4c1'
         'adf3cd0c15b4a4e5fa6c8f6a00b346c3')

build() {
  cd $srcdir/$pkgname-$pkgver

  patch -p0 -i $srcdir/$pkgname.patch
  patch -p0 -i $srcdir/utils.patch
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/schedtoold.conf "$pkgdir"/etc/schedtoold.conf
  install -Dm755 "$srcdir"/schedtoold "$pkgdir"/etc/rc.d/schedtoold
  install -Dm644 "$srcdir"/schedtoold.service "$pkgdir"/usr/lib/systemd/system/schedtoold.service
}
