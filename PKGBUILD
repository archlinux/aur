# Maintainer: Nadir Boussoukaia <nad4reg at gmail dot com>
pkgname=hotshots-updated-git
pkgver=2.2.3
pkgrel=1
pkgdesc="A HotShots fork improved - focused on using the annotations editor standalone too"
arch=('x86_64')
url="https://github.com/boussou/HotShots"
license=('GPL-2.0-or-later')
depends=('qt5-x11extras' 'qt5-multimedia')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("hotshots-git")
source=("https://github.com/boussou/HotShots/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8832ba12ecf2305972e1f35ba59d3be9acf466cc611090fc9a9f5d7ccf80bbf3')


build() {
    cd "${srcdir}/HotShots-${pkgver}"
    qmake-qt5 -recursive  HotShots.pro \
        INSTALL_PREFIX=/usr \
        INSTALL_LIBDIR=INSTALL_PREFIX/lib
    make
}

package() {
    cd "${srcdir}/HotShots-${pkgver}"
    make INSTALL_ROOT="$pkgdir" install

    install -Dm644 packaging/flatpak/HotShots.metainfo.xml -t \
        "$pkgdir/usr/share/metainfo/"
}
