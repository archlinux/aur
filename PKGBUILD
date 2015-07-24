# Maintainer: Alexandre Labrosse <almageste@melix.net>
# Contributor:  Lucas de Vries <lucasdevries@gmail.com>

pkgname=rodentbane-git
pkgver=20150724
pkgrel=3
pkgdesc="Implementation of keynav for awesome, rapid cursor control using the keyboard"
arch=('any')
url="https://github.com/dodo/rodentbane"
license=('custom:"WTFPL"')

depends=('awesome' 'xdotool')
makedepends=('git')

_gitroot="https://github.com/dodo/rodentbane.git"
_gitname=rodentbane

source=('http://www.wtfpl.net/txt/copying')
md5sums=(8365d07beeb5f39d87e846dca3ae7b64)

build() {
  cd $srcdir
  msg "Connecting to git server...."

  if [ -d $srcdir/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  mv $srcdir/$_gitname/init.lua $srcdir/$_gitname/rodentbane.lua
  luac -o $srcdir/$_gitname/rodentbane.luac $srcdir/$_gitname/rodentbane.lua
}

package() {
  install -D -m644 $srcdir/$_gitname/rodentbane.lua $pkgdir/usr/share/awesome/lib/rodentbane.lua
  install -D -m644 $srcdir/$_gitname/rodentbane.luac $pkgdir/usr/share/awesome/lib/rodentbane.luac
  install -D -m644 $srcdir/copying $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

