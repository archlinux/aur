# Maintainer: Ryan Roden-Corrent <ryan@rcorre.net>

_reponame=mc
_pkgname=myrddin
pkgname=myrddin-git
pkgver=0.3945.5d433bd
pkgrel=1
pkgdesc='Compiler and tools for the Myrddin programming language.'
arch=('i686' 'x86_64')
license=('MIT')
url="https://myrlang.org/"
source=("git://git.eigenstate.org/git/ori/mc.git")
md5sums=('SKIP')
install=myrddin.install

pkgver() {
  cd "$srcdir/$_reponame"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/$_reponame"
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$_reponame"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"

  cd "$srcdir/$_reponame/support/vim/"
  for dir in *; do
    install -t "$pkgdir/usr/share/$_pkgname/vim/$dir" -Dm644 "$dir"/*.vim
  done
}
