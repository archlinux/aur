# Maintainer: Scott Lawrence <bytbox@gmail.com>
pkgname=netcat-sec-git
pkgver=20111229
pkgrel=1
pkgdesc="A netcat clone with TLS support"
arch=('i686' 'x86_64')
url="https://github.com/bytbox/netcat-sec"
license=('MIT')
depends=('go')
makedepends=()
provides=()
conflicts=()
replaces=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/bytbox/netcat-sec.git
_gitname=netcat-sec
#_gittag=go.weekly.2011-12-22

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
  #git checkout -q $_gittag
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  ls -F
  install -d -m755 "${pkgdir}/usr/bin/"
  install -m755 netcat-sec "${pkgdir}/usr/bin/netcat-sec"
}

# vim:set ts=2 sw=2 et:
