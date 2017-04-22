# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=oh-my-git
pkgver=r227.42c11f0
pkgrel=1
pkgdesc="An opinionated git prompt for bash and zsh"
arch=("any")
url="https://github.com/arialdomartini/oh-my-git"
license=("MIT")
optdepends=("awesome-terminal-fonts-patched")
makedepends=("git")
source=("$pkgname::git+$url")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed "s/\([^-]*-g\)/r\1/;s/-/./g" ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  mkdir -p "$pkgdir/opt/$pkgname"

  cp -a "$srcdir/$pkgname/base.sh" "$pkgdir/opt/$pkgname/base.sh"
  cp -a "$srcdir/$pkgname/prompt.sh" "$pkgdir/opt/$pkgname/prompt.sh"
}
