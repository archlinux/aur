# Contributor: Leonidas <marek@xivilization.net>
pkgname=homeshick-git
pkgver=20120621
pkgrel=1
pkgdesc="bash stand-in for homesick by technicalpickles"
arch=(any)
url="https://github.com/andsens/homeshick"
license=('BSD')
makedepends=('git')

_gitroot="git://github.com/andsens/homeshick.git"
_gitname="homeshick"

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
}

package() {
  # copy the 'binary' *ahem* script
  install -D "$srcdir"/$_gitname/homeshick "$pkgdir"/usr/bin/homeshick
  # copy the licenses
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  install -m=644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/$_gitname/LICENSE*
}
