# Maintainer: Dracomage <dracomage at disroot dot org>
# Contributor: Jonas Wunderlich <aur[at]03j[dot]de>
# Contributor: Markus Weimar <mail[at]markusweimar[dot]de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>

_pkgname=fatrace
pkgname=${_pkgname}-minimal
pkgver=0.19.1
pkgrel=1
pkgdesc="Reports file access events from running processes. Without powertop and python dependency; i.e. without the 'power-usage-report' script."
arch=('x86_64' 'aarch64' 'armv6l')
url="https://github.com/martinpitt/fatrace"
license=('GPL')
depends=(glibc)
provides=($_pkgname)
conflicts=($_pkgname)
source=(fatrace.tar.gz::https://github.com/martinpitt/fatrace/archive/${pkgver}.tar.gz
        Makefile.patch)
sha256sums=('fd8f143f4e162d36c8ae29c51b32d315415447829c81091e3bb86b326051c77c'
            'e651f2a3edc6e782c1a474de1a4116653fe0b086b3da016c76332c8cacf303ac')

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
