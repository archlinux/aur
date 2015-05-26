# $Id: PKGBUILD 114071 2014-07-01 13:05:43Z kkeen $
# Maintainer:
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Nathan Curry <thegnu@gmail.com>

pkgname=rox-lib-git
_realname=rox-lib
pkgver=2.0.6.r472
pkgrel=1
pkgdesc="Shared code which can be used by other ROX applications. This is rox-lib2"
arch=("any")
url="http://rox.sourceforge.net/desktop/ROX-Lib"
license=("LGPL")
depends=("pygtk")
groups=rox-desktop
provides=("rox-lib2" "rox-lib2-git" "rox-lib" "rox-lib-git")
conflicts=("rox-lib" "rox-lib2" "rox-lib2-git" "rox-lib-git")
source=("${_realname}::git+https://github.com/rox-desktop/${_realname}.git")
md5sums=("SKIP")

pkgver(){
  cd "${_realname}"
  echo "2.0.6.r$(git rev-list --count HEAD | sed 's/-/./g' )"
}

build() {
  cd "${srcdir}/${_realname}/ROX-Lib2"
  sed -i "s|\(env python\).*|\12|" $(grep -rl "env python" .)
  sed -i '11,$d' AppRun 
  ./AppRun
}

package() {
  cd "${srcdir}/${_realname}"
  install -d "$pkgdir/usr/lib"
  cp -a ROX-Lib2 "$pkgdir/usr/lib"
}
