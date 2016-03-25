# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Ansgar Taflinski <ataflinski at uni-koblenz dot de>

_pkgname=spice-protocol
pkgname=$_pkgname-git
pkgver=0.12.9.158.g03a28f5
pkgrel=2
pkgdesc="Headers defining SPICE protocols"
arch=("any")
url="http://www.spice-space.org"
license=("BSD")
makedepends=("git" "python-six" "python-pyparsing")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://anongit.freedesktop.org/spice/spice-protocol")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --always | sed "s/^v//;s/-/./g"
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
