# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
pkgname=jj-fzf
pkgver=0.24.0
pkgrel=3
pkgdesc=" Text UI for Jujutsu based on fzf, centering around the jj log with key bindings for common operations"
arch=('any')
url="https://github.com/tim-janik/jj-fzf"
license=('MPL')
depends=('bash' 'grep' 'jujutsu')
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
  # just copy the jj-fzf script to /usr/bin
  install -Dm755 jj-fzf "$pkgdir/usr/bin/jj-fzf"
}
# vim:set ts=2 sw=2 et:
