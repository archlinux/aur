# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: xduugu <xduugu@gmx.com>

pkgname=faba-icon-theme
pkgver=4.3
pkgrel=3
pkgdesc='A sexy and modern FreeDesktop icon set with Tango and elementary influences'
arch=('any')
url='https://snwh.org/moka/'
license=('GPL3' 'CCPL:by-sa')
depends=('gtk-update-icon-cache')
makedepends=('meson')
conflicts=("${pkgname}-git")
provides=("${pkgname}")
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snwh/faba-icon-theme/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c87ce7dae8df6b25228297baa1be96cfad06c5c109ff60fedf1f0343bb0196a2')
install=${pkgname}.install

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Remove execute permission on files
    chmod -R -x+X .
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson --prefix=/usr --buildtype=plain "build"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C "build" install
}
