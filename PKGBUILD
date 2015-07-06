# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=termpalette-git
pkgver=20130108
pkgrel=1
pkgdesc="Terminal ANSI color palette viewer written in python"
arch=(any)
url="https://github.com/sseemayer/TermPalette"
license=('MIT')
depends=('python')
makedepends=('git')
options=(!emptydirs)
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/sseemayer/TermPalette.git
_gitname=termpalette

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
  cd "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
