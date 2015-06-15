# Maintainer: Ramana Kumar <firstname at member.fsf.org>
pkgname=pacnews-git
pkgver=20120731
pkgrel=1
pkgdesc="Find .pacnew files and merge them with vimdiff"
arch=(any)
url="http://github.com/pbrisbin/scripts/blob/master/pacnews"
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/pbrisbin/scripts.git"
_gitname="scripts"

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
  mkdir -p "$pkgdir/usr/bin"
  install ${pkgname%-git} "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
