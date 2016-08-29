# Maintainer: Sebastian Gumprich <sebastian.gumprich@38.de>
# Contributor: shimi <shimi.chen@gmail.com>
# Contributor: Gustavo Castro <gustawho at gmail dot com>
pkgname=indicator-kdeconnect-git
pkgver=56.e533361
pkgrel=2
_gitname=indicator-kdeconnect
pkgdesc="Integrate KDEConnect on desktop environments that use AppIndicators (e.g. Unity)"
arch=('any')
url="https://github.com/vikoadi/indicator-kdeconnect"
license=('GPL')
depends=('libappindicator-gtk3' 'kdeconnect' 'vala')
makedepends=('git' 'cmake')
source=('git://github.com/albertvaka/indicator-kdeconnect.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd indicator-kdeconnect
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR="${pkgdir}" install
  for f in ${pkgdir}/usr/share/icons/hicolor/scalable/devices/*.svg; do cp $f ${pkgdir}/usr/share/icons/hicolor/scalable/devices/$(basename "$f").png; done
}
