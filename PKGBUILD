# Maintainer: Christophe-Marie Duquesne <chm.duquesne@gmail.com>

pkgname=python2-skypipe-git
pkgver=20120901
pkgrel=1
pkgdesc="netcat through dotcoud"
arch=(any)
url="https://github.com/progrium/skypipe"
license=('MIT')
depends=('python2' 'python2-colorama' 'python2-pyzmq-static'
         'python2-requests')
makedepends=('git')
provides=('skypipe')
conflicts=('skypipe')

_gitroot="https://github.com/progrium/skypipe.git"
_gitname="skypipe"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "Running the install script..."
  cd "$srcdir/$_gitname"
  ls
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
