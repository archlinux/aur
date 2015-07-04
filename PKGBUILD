# Maintainer : Marc W <Marrc666 @ live . de>

pkgname=rocrail-git 
pkgver=git
pkgrel=2015
pkgdesc="Rocrail - Model Railroad Control System"
arch=('i686' 'x86_64')
url=('http://wiki.rocrail.net/')
license=('GPL3')
depends=('wxgtk' 'libusb' 'webkitgtk2')
makedepends=('git')
source=()
md5sums=()
 
_gitroot=https://github.com/rocrail/Rocrail
_gitname=Rocrail

build() {
  cd "$srcdir"
  rm -rf $_gitname
  msg "Connecting to GIT server...."

  git clone --depth 1 "$_gitroot" "$_gitname"

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"


  if [ "$CARCH" = "i686" ] ; then
    make all
  elif [ "$CARCH" = "x86_64" ] ; then
    make fromtar
  fi
}

package() {
  cd "$srcdir/$_gitname-build/rocrail/package/"
  install -Dm644 Rocrail.desktop "$pkgdir/usr/share/applications/Rocrail.desktop"
  install -Dm644 Rocview.desktop "$pkgdir/usr/share/applications/Rocview.desktop"
 
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/opt/rocrail" install

}
  
