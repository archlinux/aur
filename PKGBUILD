# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Steve Skydev <steve@skycoin.net>
pkgname=cx-bin
pkgname1=cx
projectname=skycoin
pkgdesc="CX Skycoin Blockchain Programming Language; latest binary release"
pkgver=0.7
pkggopath="github.com/$projectname/$pkgname1"
pkgrel=1
arch=('x86_64')
url="https://${pkggopath}"
license=()
makedepends=('unzip')
provides=('cx')
conflicts=('cx')
source=("https://$pkggopath/releases/download/v$pkgver/$pkgname1-$pkgver-bin-linux-x64.zip")
sha256sums=('eca1452d7d24be43d122213c70e8c573a6debb32f9834dd6531068f48ab34422')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')

prepare() {
mkdir -p $srcdir/bin
mv $pkgname1-$pkgver-bin-linux-x64.zip $srcdir/bin/$pkgname1-$pkgver-bin-linux-x64.zip
cd $srcdir/bin
unzip $pkgname1-$pkgver-bin-linux-x64.zip
}

package() {
msg2 'installing CX'
options=(!strip staticlibs)
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/lib/$projectname/go/bin
export GOPATH=$pkgdir/usr/lib/$projectname/go
export GOBIN=$pkgdir/usr/lib/$projectname/go/bin
install -Dm755 $srcdir/$pkgname1 $pkgdir/usr/lib/$projectname/go/bin/$pkgname1
ln -rTsf $pkgdir/usr/lib/$projectname/go/bin/$pkgname1 $pkgdir/usr/bin/$pkgname1
chmod 755 $pkgdir/usr/bin/$pkgname1
}
