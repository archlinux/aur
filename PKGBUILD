# Maintainer: Rebecca Jones <hakusdream+aur@gmail.com>
pkgname=makehuman-community-plugins
pkgver=1.1.1
pkgrel=1
pkgdesc="Supplemental community plugins for the MakeHuman program."
arch=('any')
url="http://www.makehuman.org/"
depends=('makehuman' 'python')
makedepends=('git')
license=('AGPL3')
source=("git+https://github.com/makehumancommunity/community-plugins/")
md5sums=('SKIP')

build() {
  cd "$srcdir/community-plugins/makehuman"
  for d in "$srcdir/community-plugins/makehuman"; do
    cd $d
    # compile all modules so that they can be tracked by pacman
    python2 -m compileall .
    # and also optimize them
    python2 -OO -m compileall .
    cd ..
  done
}

package() {
  install -d -m755 "$pkgdir/opt/makehuman/plugins"
  cp -a -r "$srcdir/community-plugins/makehuman/"* "$pkgdir/opt/makehuman/plugins"
}
