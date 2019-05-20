# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Steve Skydev <steve@skycoin.net>
pkgname=cx
projectname=skycoin
pkgdesc="CX Skycoin Blockchain Programming Language"
pkgver=0.7beta
pkggopath="github.com/$projectname/$pkgname"
pkgrel=1
arch=('x86_64')
url="https://${pkggopath}"
license=()
makedepends=('unzip')
source=("https://$pkggopath/releases/download/v$pkgver/$pkgname-$pkgver-bin-linux-x64.zip")
sha256sums=('aa3e7134b180b9e877e0e037d68cd27e8c8cfca2cd5baf04c5a75860f9d67470')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')

prepare() {
mkdir -p $srcdir/bin
mv $pkgname-$pkgver-bin-linux-x64.zip $srcdir/bin/$pkgname-$pkgver-bin-linux-x64.zip
cd $srcdir/bin
unzip $pkgname-$pkgver-bin-linux-x64.zip
}

package() {
msg2 'installing CX'
options=(!strip staticlibs)
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/lib/$projectname/go/bin
export GOPATH=$pkgdir/usr/lib/$projectname/go
export GOBIN=$pkgdir/usr/lib/$projectname/go/bin
install -Dm755 $srcdir/$pkgname $pkgdir/usr/lib/$projectname/go/bin/$pkgname
ln -rTsf $pkgdir/usr/lib/$projectname/go/bin/$pkgname $pkgdir/usr/bin/$pkgname
chmod 755 $pkgdir/usr/bin/$pkgname
}
