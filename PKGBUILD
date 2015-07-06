# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=zapply-git
pkgver=20140731
pkgrel=1
pkgdesc="Batch-run commands with zsh globbing and pattern matching"
arch=(any)
url="https://github.com/sseemayer/Zapply"
license=('MIT')
depends=(zsh)
optdepends=(
  'parallel: parallel apply support'
)
makedepends=('git')

_gitroot=https://github.com/sseemayer/Zapply.git
_gitname=zapply

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"

  install -Dm 755 "$srcdir/$_gitname-build/za" "$pkgdir/usr/bin/za"
  install -Dm 644 "$srcdir/$_gitname-build/za.1" "$pkgdir/usr/share/man/man1/za.1"

}

# vim:set ts=2 sw=2 et:
