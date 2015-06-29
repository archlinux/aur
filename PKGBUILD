# Contributor: Liu Yuyang <lhtlyy at googlemail dot com>
# Maintainer:Liu Yuyang <lhtlyy at googlemail dot com>

pkgname=gimp-plugin-beautify
pkgver=20121117
pkgrel=1
epoch=0
pkgdesc="GIMP Beautify is a set of GIMP plug-ins for quickly and easily beautify photo "
arch=('i686' 'x86_64')
url="https://github.com/hejiann/beautify"
license=('GPL3')
depends=('gimp')
makedepends=('git')

_gitroot="git://github.com/hejiann/beautify.git"
_gitname="beautify"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm 755 "$srcdir/$_gitname-build/beautify" "$pkgdir/usr/lib/gimp/2.0/plug-ins/beautify" 
  install -Dm 755 "$srcdir/$_gitname-build/skin-whitening" "$pkgdir/usr/lib/gimp/2.0/plug-ins/skin-whitening" 
  install -Dm 755 "$srcdir/$_gitname-build/simple-border" "$pkgdir/usr/lib/gimp/2.0/plug-ins/simple-border" 
  install -Dm 755 "$srcdir/$_gitname-build/border" "$pkgdir/usr/lib/gimp/2.0/plug-ins/border" 
} 
 
