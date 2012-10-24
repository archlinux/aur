# Maintainer: Vianney le Clément <vleclement AT gmail· com>
pkgname=gedit-coffeescript-git
pkgver=20121024
pkgrel=1
pkgdesc="gedit Syntax Highlighting for CoffeeScript files"
arch=(any)
url="https://github.com/wavded/gedit-coffeescript"
license=('GPL')
depends=('gtksourceview3')
makedepends=('git')

_gitroot=https://github.com/wavded/gedit-coffeescript.git
_gitname=gedit-coffeescript

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
  install -Dm644 coffee_script.lang "$pkgdir/usr/share/gtksourceview-3.0/language-specs/coffee_script.lang"
  install -Dm644 rubycius-mod.xml "$pkgdir/usr/share/gtksourceview-3.0/styles/rubycius-mod.xml"
}

# vim:set ts=2 sw=2 et:
