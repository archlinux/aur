# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=pipewatch-git
_pkgname=pw
pkgver=r66.f05725f
pkgrel=1
pkgdesc='Pipe Watch: Monitor recent lines of output from pipe'
arch=('x86_64')
url='https://github.com/nhorman/dropwatch'
license=('BSD')
source=("git+https://www.kylheku.com/git/pw")
sha256sums=('SKIP')
makedepends=('git')
depends=(
)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    # Makefile is a bit lacking
    #make DESTDIR="$pkgdir" install
    #mkdir -p $pkgdir/{bin,usr/share/man/man1/}
    install -Dm0755 -t $pkgdir/usr/bin pw
    install -Dm0644 -t $pkgdir/usr/share/man/man1 pw.1
}
