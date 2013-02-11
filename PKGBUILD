# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=gimp-imagescaler-git
pkgver=20130211
pkgrel=1
pkgdesc="Gamma-correct image scaling (Gimp, Python)"
arch=('any')
url="https://blog.hartwork.org/?p=1173"
license=('GPL')
depends=('gimp' 'python2')
makedepends=('git')
provides=('gimp-imagescaler')
conflicts=('gimp-imagescaler')

_gitroot=git://git.goodpoint.de/imagescaler.git
_gitname=imagescaler

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
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root=$pkgdir
}
# vim:set ts=2 sw=2 et:
