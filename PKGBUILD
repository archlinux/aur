# Maintainer: Harley Wiltzer <harleyw@hotmail.com>
pkgname=hasklock
pkgver=0.1.1
pkgrel=2
pkgdesc="A binary clock in ncurses written in Haskell"
arch=('x86_64')
url="https://github.com/DestructiveReasoning/hasklock"
license=('BSD')
groups=()
depends=('ncurses')
#makedepends=('git','haskell-text','haskell-hscurses')
makedepends=('git')
makedepends=('git' 'haskell-text' 'haskell-hscurses')
#makedepends=('git')
provides=('hasklock')
conflicts=()
replaces=()
backup=()
options=()
install=hasklock.install
source=($pkgname::git+https://github.com/DestructiveReasoning/hasklock.git)
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot=https://github.com/DestructiveReasoning/hasklock.git
_gitname=hasklock

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin master
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
#./autogen.sh
#  ./configure --prefix=/usr
#  make 
}

package() {
  cd "$srcdir/$_gitname"
  make
  install -Dm 755 Hasklock "$pkgdir/usr/bin/$_gitname"
#make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP')
