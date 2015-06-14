# Maintainer: Harley Wiltzer <harleyw@hotmail.com>
pkgname=savant-git
pkgver=0.3.0
pkgrel=1
pkgdesc="A CLI based calculator that supports variables and uses SDL2 to do graphs."
arch=('x86_64')
url="https://github.com/DestructiveReasoning/savant"
license=('BSD')
groups=()
depends=('sdl2')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=savant-git.install
source=($pkgname::git+https://github.com/DestructiveReasoning/Savant.git)
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot=https://github.com/DestructiveReasoning/Savant.git
_gitname=savant

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
  if [ ! -d "$HOME/.savant" ]; then
    mkdir "$HOME/.savant"
  fi
  cp logo "$HOME/.savant/logo"
#make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
