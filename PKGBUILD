# Maintainer: Arnaud Joset <info@agayon.be>

pkgname=python-rplidar-git
pkgver=20170721
pkgrel=1
pkgdesc="Simple and lightweight module for working with RPLidar laser scanners"
arch=(any)
url="https://github.com/SkoltechRobotics/rplidar.git"
license=('MIT')
depends=('python')
makedepends=('git')
options=(!emptydirs)
optdepends=('')

conflicts=('python-rplidar')

_gitroot="https://github.com/SkoltechRobotics/rplidar.git"
_gitname="rplidar"


package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname/"

  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python setup.py install --root="$pkgdir/" --optimize=1
}
