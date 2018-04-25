# Contributor: <josh.jpenguin@gmail.com>
_pkgname=eggwm
pkgname=$_pkgname-qt5
pkgver=r10.79e245a
pkgrel=1
pkgdesc="A simple and light Qt5 WM.  100% compatible with the EWMH and ICCCM standards."
url="https://notabug.org/tux_peng/eggwm"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras')
makedepends=('git' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://notabug.org/tux_peng/eggwm.git#commit=79e245a8c855df45cfd9356ca56628048ba46d0d")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_pkgname"
  export QT_SELECT=5
  qmake
  make
}

package() {
  cd "$_pkgname"
  find installation -type f | xargs chmod -x 
  install -d "$pkgdir"/usr/share/eggwm
  cp -R installation/* "$pkgdir"/usr/share/eggwm
  install -D -m755 eggwm "$pkgdir"/usr/bin/eggwm
}
