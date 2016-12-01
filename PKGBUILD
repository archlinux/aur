# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=archiver
pkgver=2.0
pkgrel=0
pkgdesc="Easily create and extract .zip, .tar, .tar.gz, .tar.bz2, .tar.xz, and .rar (extract-only) files with Go"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/mholt/archiver"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("https://github.com/mholt/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bf11f62964299cef1f5acf982e12b628dd1d7ec9842689ff8f8f59cc37b3b669')

prepare() {
 mkdir -p "$srcdir/go"
 export GOPATH="$srcdir/go"
 go get github.com/ulikunitz/xz
 go get github.com/dsnet/compress/bzip2
 go get github.com/nwaples/rardecode
 go get github.com/mholt/archiver
 cd $srcdir/$pkgname-$pkgver/cmd/$pkgname
 go build
}

package() {
  cd $srcdir/$pkgname-$pkgver/cmd/$pkgname 
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
  rm -r  "$srcdir/go"
}
# vim:set ts=2 sw=2 et:
