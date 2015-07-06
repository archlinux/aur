# Contributor: realitygaps <realitygaps AT yahoo DOT com>

pkgname=gereqi-git
pkgver=20100624
pkgrel=1
pkgdesc="Gereqi media player"
arch=(any)
url=("http://code.google.com/p/gereqi/")
license=('GPL')
depends=('python' 'mutagen' 'python-lxml' 'cddb-py' 'pyinotify')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
_gitroot="git://github.com/regomodo/Gereqi.git"
_gitname="Gereqi"
build() {
  cd $srcdir

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


  python setup.py install --root=$pkgdir/ --optimize=1 || return 1

  # Remember to install licenses if the license is not a common license!
  # install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

