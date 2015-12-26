# Contributor: <josh.jpenguin@gmail.com>
_pkgname=eggwm
pkgname=$_pkgname-qt5
pkgver=git
pkgrel=1
pkgdesc="A simple and light Qt5 WM.  100% compatible with the EWMH and ICCCM standards."
url="https://github.com/xiangzhai/eggwm/"
arch=('i686' 'x86_64')
license=("GPL3")
depends=("qt5-base" "qt5-x11extras")
makedepends=("git" "qt5-tools")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/xiangzhai/$_pkgname.git")
sha256sums=("SKIP")


build() {
  cd "$srcdir/$_pkgname"
  export QT_SELECT=5
  qmake
  make
}

package() {
  cd "$srcdir/$_pkgname"
  find installation -type f | xargs chmod -x 
  install -d "$pkgdir/usr/share/eggwm"
  cp -R installation/* "$pkgdir/usr/share/eggwm"
  install -D -m755 eggwm "$pkgdir/usr/bin/eggwm"
}
