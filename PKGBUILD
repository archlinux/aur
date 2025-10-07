# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
pkgname=jj-fzf
pkgver=0.34.0
pkgrel=5
pkgdesc=" Text UI for Jujutsu based on fzf, centering around the jj log with key bindings for common operations"
arch=('any')
url="https://github.com/tim-janik/jj-fzf"
license=('MPL')
depends=('bash' 'grep' 'jujutsu' 'fzf')
makedepends=('make' 'shellcheck' )
sha256sums=('SKIP')
source=("git+$url.git#tag=v$pkgver")

prepare() {
  cd "$srcdir/$pkgname"
  [ -d "./.jj" ] || jj git init --colocate
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  # FIXME: make install should take care of this https://github.com/tim-janik/jj-fzf/issues/7
  #mkdir -p "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install
}
# vim:set ts=2 sw=2 et:
