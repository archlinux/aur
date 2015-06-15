# Maintainer: morning_star <livef3@aol.com>
pkgname=mounter2-git
pkgver=f254a261.4.2
pkgrel=2
pkgdesc="A simple gtk app to mount iso files"
arch=('any')
url="https://sourceforge.net/projects/mounter2/"
license=('GPL 2.1')
depends=('udevil' 'gtk2')
makedepends=('git')
conflicts=()
provides=()

_gitname="mounter2"
_gitroot="https://github.com/dreemsoul/mounter2"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
 cd $srcdir
 msg "Connecting to GIT server..."
 if [ -d $_gitname ]; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
 else
   git clone --depth=1 $_gitroot $_gitname
 fi
 msg "GIT checkout done or server timeout"
}


package() {
  cd "$srcdir/$_gitname"
  mkdir -p $pkgdir/usr/bin
  make -f makefile
  cp mounter2 $pkgdir/usr/bin/
  chmod +x $pkgdir/usr/bin/
}
