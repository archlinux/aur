# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=wiki
pkgver=1.3.0
pkgrel=1
pkgdesc="Command line tool to fetch summaries from mediawiki wikis, like Wikipedia "
arch=('any')
url="https://github.com/walle/wiki"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
conflicts=('wiki-git')
source=("https://github.com/walle/wiki/archive/$pkgver.tar.gz")
md5sums=('30eca4368084cfe103a97ec2ad257497')
_gourl=github.com/walle/wiki/cmd/wiki

build() {
  export GOPATH=$srcdir
  go get $_gourl
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 $srcdir/bin/wiki "$pkgdir/usr/bin"
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
  mkdir -p $pkgdir/usr/share/man/man1/
  install -m 0644 _doc/wiki.1 $pkgdir/usr/share/man/man1/

}
