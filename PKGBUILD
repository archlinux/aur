# Maintainer: ValHue <vhuelamo at gmail dot com>
# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: aericson <de.ericson at gmail dot com>
# Contributor: Rorschach <r0rschach at lavabit dot com>
# Contributor: Andrew Kravchuk <awkravchuk at gmail dot com>
#
pkgname="aarchup"
pkgver=2.1.0
pkgrel=1
pkgdesc="Fork of archup a small and lightweight update-notifier for archlinux."
url="https://github.com/inglor/aarchup"
arch=('i686' 'x86_64')
license=('GPL3')
provides=("${pkgname}")
depends=('libnotify' 'gtk2')
makedepends=('libnotify' 'cmake' 'ninja' 'gzip')
optdepends=('auracle: AUR support(--aur)')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('51adb6e1ebf500281c2874dbf624a869f83c927c7aac6e19645fdc0e64cddec7')


prepare() {
    mkdir "${pkgname}-${pkgver}/build"
}

build() {
    cd "${pkgname}-${pkgver}/build"
    cmake .. -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja all
}

package() {
    cd "${pkgname}-${pkgver}/build"
    DESTDIR="$pkgdir" ninja install
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
