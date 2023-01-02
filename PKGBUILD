# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=chkrootkit
pkgver=0.56
pkgrel=1
pkgdesc="Locally checks for signs of a rootkit"
arch=('x86_64')
url="http://www.chkrootkit.org/"
license=('CUSTOM')
optdepends=('tiger: a wrapper for chkrootkit')
source=("ftp://ftp.chkrootkit.org/pub/seg/pac/$pkgname-$pkgver.tar.gz")
sha512sums=('23d07313ec720cab4c28ac0a7c203c3d7b13503d224c0f9eb585addb5dd54901cb200506777aac84e93a258163d571863c5609d4d0f1bb3f0ddeb2e5ab959520')

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
