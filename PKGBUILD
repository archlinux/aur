# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
pkgbase=libcfg+
pkgname=(libcfg+ libcfg+-docs)
pkgver=0.7.0
pkgrel=1
pkgdesc="command line and configuration file parsing library"
arch=('i686' 'x86_64')
url="http://opensource.platon.org/projects/main_page.php?project_id=3"
license=('GPL')
depends=()
source=("http://opensource.platon.org/upload/_projects/00003/libcfg+-${pkgver}.tar.gz")
md5sums=('7f8a415e508da4b2b060d3894d4c510a')

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  unset CFLAGS LDFLAGS

  ./configure --prefix=/usr
  make
}

package_libcfg+() {
  cd "$srcdir/$pkgbase-$pkgver"

  make -j1 DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/usr/share"
}

package_libcfg+-docs() {
  pkgdesc="${pkgdesc} (documentation)"
  arch=(any)

  cd "$srcdir/$pkgbase-$pkgver"

  make -j1 DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib"
}
