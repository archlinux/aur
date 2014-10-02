# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Leonid Selivanov <bravebug at gmail dot com>

pkgname=retrovol-git
pkgver=0.14.r0.g6579b8c
pkgrel=2
pkgdesc="A sound volume mixer"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://puppylinux.svn.sourceforge.net/viewvc/puppylinux/retrovol/"
depends=('gtk2' 'alsa-lib')
makedepends=('git')
provides=('retrovol')
conflicts=('retrovol')
source=("$pkgname::git+https://github.com/pizzasgood/retrovol.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r 's,^v,,;s,-,.r,;s,[-_],.,g'
}
prepare() {
  cd $pkgname
  autoreconf -fiv
}
build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
