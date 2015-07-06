# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=gridloc
pkgver=0.7
pkgrel=1
pkgdesc="Ham Radio Maidenhead grid converter & bearing + distance calculator"
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/locator/gridloc/gridloc.html"
license=('GPL')
depends=('bash')
source=(http://www.qsl.net/5b4az/pkg/locator/gridloc/gridloc-0.7.tar.bz2
	diff.Makefile
	$pkgname
	$pkgname.1)

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -p0 < ../diff.Makefile
}

build() {
  cd $srcdir/$pkgname-$pkgver

  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver

  install -Dm755 ../gridloc $pkgdir/usr/bin/gridloc
  install -Dm755 gridloc $pkgdir/usr/bin/gridloc.1

  install -Dm644 default/.gridlocrc $pkgdir/usr/share/$pkgname/gridlocrc

  install -Dm644  ../$pkgname.1 $pkgdir/usr/share/man/man1
  install -Dm644 doc/$pkgname.html $pkgdir/usr/share/doc/$pkgname/$pkgname.html
}
md5sums=('9e1437ea29f5b9380501fd5258c8bdf5'
         '747e7f0e28d70e1acaa9c4c195c94510'
         'a300bf4eeea7624516cfef35e3c63e3d'
         'b553a1ae3de7c467055d6072959c1230')
sha256sums=('2e1b53ed478402d65a50ad0d0ed860415337d2e2867ebdef494e9ccfc0a2cdf4'
            '37a48068265b5dd79fab34dbd76d72b56fef48cab640c860832b4c056e289d1c'
            'dc158c315d805d97b47d740dcd05eda4ce9da2fa9fe350ae5c899c6d0bd91069'
            'e0a4957ed18b7526685056cae0c9bfddb833727a223cc4c0de1cf928a8b9c867')
