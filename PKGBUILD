# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=chkrootkit
pkgver=0.59
pkgrel=1
pkgdesc="Locally checks for signs of a rootkit"
arch=('x86_64')
url="http://www.chkrootkit.org/"
license=('CUSTOM')
optdepends=('tiger: a wrapper for chkrootkit')
source=("ftp://ftp.chkrootkit.org/pub/seg/pac/$pkgname-$pkgver.tar.gz")
sha512sums=('b67b726e60e58d1486bae171f6de0ba6422f71822aa62cb14bc9fcc30edbb6e00d84673a58a9cb8cf21da18d41355d0ee14135b848eafb69045315f519ac33e4')

build() {
  make -C "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  for f in check_wtmpx chkdirs chklastlog chkproc chkrootkit chkutmp chkwtmp ifpromisc strings-static; do
    install -Dvm755 -t "$pkgdir/usr/lib/$pkgname" "$f"
  done

  install -Dvm644 -t "$pkgdir/usr/share/licenses/$pkgname"        COPYRIGHT
  install -Dvm644 -t "$pkgdir/usr/share/doc/$pkgname"             ACKNOWLEDGMENTS
  install -Dvm644 -t "$pkgdir/usr/share/doc/$pkgname"             README

  install -dvm 755 "$pkgdir/usr/bin"
  ln -vs "../lib/$pkgname/chkrootkit" "$pkgdir/usr/bin/chkrootkit"
}
