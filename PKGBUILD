# Maintainer: Harley Wiltzer <harleyw@hotmail.com>
pkgname=conway-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A conway's game of life player that uses ncurses"
arch=('x86_64')
url="https://github.com/DestructiveReasoning/Conway"
license=('BSD')
groups=()
depends=('ncurses')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=conway-git.install
source=($pkgname::git+https://github.com/DestructiveReasoning/Conway.git)
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot=https://github.com/DestructiveReasoning/Conway.git
_gitname=conway

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

  #
  # BUILD HERE
  #
#./autogen.sh
#  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm 755 a.out "$pkgdir/usr/bin/$_gitname"
  if [ ! -d "$HOME/.conway" ]; then
    mkdir "$HOME/.conway"
  fi
  cp conwaylogo "$HOME/.savant/conwaylogo"
#make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP')
