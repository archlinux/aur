# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmmaiload
pkgver=2.3.0
pkgrel=1
pkgdesc="A dockapp that monitors your incoming mails"
arch=('i686' 'x86_64')
license=('GPL')
url="http://tnemeth.free.fr/projets/dockapps.html"
depends=('gtk2' 'libxpm')
source=("http://tnemeth.free.fr/projets/programmes/$pkgname-$pkgver.tar.bz2"
        "build$pkgver.patch")
md5sums=('ad45b973e905d3e2daa3575fe4097097'
         '45e2e2105b312b0c5f4977fe3ba023df')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -b -z .orig <../build$pkgver.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #make DESTDIR="$pkgdir" install
  install -Dm0755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm0755 "$pkgname-config/$pkgname-config" "$pkgdir/usr/bin/$pkgname-config"
  install -Dm0644 "doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm0644 "doc/$pkgname-config.1" "$pkgdir/usr/share/man/man1/$pkgname-config.1"
  install -Dm0655 "doc/sample.${pkgname}rc" "$pkgdir/usr/share/$pkgname/${pkgname}rc"
}

# vim: set sw=2 et:
