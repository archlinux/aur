# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=kate-syntax-mustache-git
pkgver=20130127
pkgrel=1
pkgdesc="Mustache syntax highlighting for the KDE Katepart."
arch=('any')
url="https://github.com/20after4/Mustache-Highlighting"
license=('GPL' 'BSD')
groups=()
depends=()
makedepends=('git')
noextract=()
#md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/20after4/Mustache-Highlighting.git
_gitname=kate-mustache

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
  mkdir -p $pkgdir/usr/share/apps/katepart/syntax/
  cp mustache.xml $pkgdir/usr/share/apps/katepart/syntax/
}

# vim:set ts=2 sw=2 et:
