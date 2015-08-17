# Maintainer: Wojciech Siewierski <darkvifon at gmail dot com>
pkgname=urxvt-autocomplete-all-the-things-git
pkgver=20120115
pkgrel=1
pkgdesc="an urxvt plugin allowing user to easily complete words"
url="https://github.com/Vifon/autocomplete-ALL-the-things"
arch=('any')
license=('GPL')
depends=('rxvt-unicode')
makedepends=('git')
install='autocomplete-ALL-the-things.install'

_gitroot="git://github.com/Vifon/autocomplete-ALL-the-things.git"
_gitname="autocomplete-ALL-the-things"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin --depth=1
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname --depth=1
  fi

  msg "GIT checkout done or server timeout"
  rm -rf "$srcdir/$_gitname-build"
  cp -r  "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd     "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m 644 "autocomplete-ALL-the-things" "$pkgdir/usr/lib/urxvt/perl/autocomplete-ALL-the-things"
}
