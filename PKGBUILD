# Maintainer: trickart <trickart412+aur@gmail.com>

pkgname=ginn
pkgver=r93
pkgrel=3
pkgdesc="Gesture Injector: No-GEIS, No-Toolkits."
arch=('i686' 'x86_64')
url="https://launchpad.net/ginn/"
license=('GPL3')
depends=('bamf' 'geis')
makedepends=('bzr')
source=(bzr+https://launchpad.net/ginn/)
sha256sums=('SKIP')
pkgver() {
  cd ${pkgname}
  printf "r%s" "$(bzr revno)"
}
build() {
    cd "${srcdir}/ginn"
    ./autogen.sh
    ./configure
    make
}
package(){
    cd $pkgname
    make DESTDIR="$pkgdir/" prefix="/usr" sysconfdir="/etc" mandir="/usr/share/man" install
    install -D -m 644 COPYING $pkgdir/usr/share/licenses/ginn/COPYING

}
