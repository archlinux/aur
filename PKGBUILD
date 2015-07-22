# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Ansgar Taflinski <ataflinski at uni-koblenz dot de>

_pkgname=spice-protocol
pkgname=$_pkgname-git
pkgver=0.12.8.1.g4ba5072
pkgrel=1
pkgdesc='Headers defining SPICE protocols'
arch=('any')
url='http://www.spice-space.org'
license=('custom')
makedepends=('git')
provides=('spice-protocol')
conflicts=('spice-protocol')
source=('git://anongit.freedesktop.org/spice/spice-protocol')
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --always | sed 's/-/./g'
}

build() {
    cd $_pkgname
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd $_pkgname
    make DESTDIR=$pkgdir install
    install -D -m644 $srcdir/$_pkgname/COPYING \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
