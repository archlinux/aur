# Maintainer: ValHue <vhuelamo at gmail dot com>
# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: aericson <de.ericson at gmail dot com>
# Contributor: Rorschach <r0rschach at lavabit dot com>
# Contributor: Andrew Kravchuk <awkravchuk at gmail dot com>
#
pkgname="aarchup"
pkgver=1.8.3
pkgrel=1
pkgdesc="Fork of archup a small and lightweight update-notifier for archlinux."
url="https://github.com/inglor/aarchup"
arch=('i686' 'x86_64')
license=('GPL3')
provides=("${pkgname}")
depends=('libnotify' 'gtk2')
makedepends=('libnotify' 'autoconf' 'gzip')
optdepends=('auracle: AUR support(--aur)')
install='aarchup.install'
source=("${pkgname}-${pkgver}.zip::${url}/archive/${pkgver}.zip")
sha256sums=('1e5440ea6ce8ddded31f6d9ab9f62743c99ba9b56f65fd8f92a965d7970ead3e')

prepare() {
    mv "${pkgname}-${pkgver}"/src/* "${pkgname}-${pkgver}"
    rmdir "${pkgname}-${pkgver}"/src
}

build() {
    cd "${pkgname}-${pkgver}"
    autoconf
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
