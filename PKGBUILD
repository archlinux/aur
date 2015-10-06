# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=wiki-git
pkgver=r2.774203e
pkgrel=1
pkgdesc="Command line tool to fetch summaries from mediawiki wikis, like Wikipedia "
arch=('any')
url="https://github.com/walle/wiki"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=($pkgname::git+https://github.com/walle/wiki.git)
md5sums=('SKIP')
_gourl=github.com/walle/wiki/cmd/wiki
pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH=$srcdir
  go get $_gourl
  cd $srcdir/wiki-git
  make DESTDIR="$pkgdir"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 $srcdir/bin/wiki "$pkgdir/usr/bin"
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
  mkdir -p $pkgdir/usr/share/man/man1/
  install -m 0644 _doc/wiki.1 $pkgdir/usr/share/man/man1/

}
