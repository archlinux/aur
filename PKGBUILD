# Maintainer: Dracomage <dracomage at disroot dot org>
# Contributor: Jonas Wunderlich <aur[at]03j[dot]de>
# Contributor: Markus Weimar <mail[at]markusweimar[dot]de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>

_pkgname=fatrace
pkgname=${_pkgname}-minimal
pkgver=0.18.0
pkgrel=1
pkgdesc="Reports file access events from all running processes. Without powertop and python dependency; i.e. without the 'power-usage-report' script."
arch=('x86_64' 'aarch64' 'armv6l')
url="https://github.com/martinpitt/fatrace"
license=('GPL')
depends=(glibc)
provides=($_pkgname)
conflicts=($_pkgname)
source=(fatrace.tar.gz::https://github.com/martinpitt/fatrace/archive/${pkgver}.tar.gz
        Makefile.patch)
sha256sums=('f2ca2623c7b3744d01827e0301df315e8b428c9a479081469ee6d21d0889de51'
            '4b4c974c24d2ba9928ff578952656fa3383f6d5142b98b86aecb051668c43896')

prepare() {
    patch --directory="$_pkgname-$pkgver" --forward --strip=2 --input="${srcdir}/Makefile.patch"
}

build() {
    cd "$_pkgname-$pkgver"
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
