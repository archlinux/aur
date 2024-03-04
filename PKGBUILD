# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=chkrootkit
pkgver=0.58b
pkgrel=1
pkgdesc="Locally checks for signs of a rootkit"
arch=('x86_64')
url="http://www.chkrootkit.org/"
license=('CUSTOM')
optdepends=('tiger: a wrapper for chkrootkit')
source=("ftp://ftp.chkrootkit.org/pub/seg/pac/$pkgname-$pkgver.tar.gz")
sha512sums=('50829446aa5a320ef3aa678c7bbc03ba2ebc14dca3b4c1f312fb46d3d8206345628d2e94b99cfea33e0d3971afbc025dbd387fb32c4e1135a7466c20eb3afab2')

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
