# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org> 
pkgname=uwsgitop-git
pkgver=20130415
pkgrel=1
pkgdesc="uWSGI stats viewer"
arch=('i686' 'x86_64')
url="http://github.com/unbit/uwsgitop.git"
license=('GPL')
depends=('python2')
conflicts=('')
makedepends=('git' 'python2-distribute')

_gitroot="https://github.com/unbit/uwsgitop.git"
_gitname="uwsgitop"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot 
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_gitname"
  sed -i "s|#\!python|#\!/usr/bin/python2|" uwsgitop
  chmod +x uwsgitop
  python2 setup.py install --prefix=/usr --root="$pkgdir"
} 
