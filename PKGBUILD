# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=netsurf-buildsystem-git
pkgver=20120904
pkgrel=1
pkgdesc="Netsurf Build System"
arch=('x86_64' 'i686')
url='http://source.netsurf-browser.org/?p=buildsystem.git;a=summary'
license=('unknown')
provides=('netsurf-buildsystem')
conflicts=('netsurf-buildsystem')
_gitroot='git://git.netsurf-browser.org/buildsystem.git'
_gitname='buildsystem'

build() {
  msg "Connecting to the $_gitname git repository..."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi

  msg "GIT checkout done or server timeout"
  cd "$srcdir"
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
}

package() {
  cd "$_gitname-build"

  make install PREFIX="$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
