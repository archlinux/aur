# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer-plugins
pkgver=3.4.4
pkgrel=1
pkgdesc="Plugins for xviewer. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL-2.0-or-later')
depends=(
    'xviewer'
    'libpeas'
)
makedepends=(
    'gnome-common'
    'gobject-introspection'
    'meson'
    'osm-gps-map'
)
optdepends=(
    'osm-gps-map: Map plugin'
)
provides=($pkgname)
conflicts=('xviewer-plugins-git')
url='https://github.com/linuxmint/xviewer-plugins'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4ba1747cfd78b6c9a91523bbd8eee63c')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    mkdir -p "${srcdir}"/${pkgname}-${pkgver}/build
    cd "${srcdir}"/${pkgname}-${pkgver}/build

    meson --prefix=/usr \
          --libexecdir=lib/${pkgname} \
          --buildtype=plain \
          ..
    ninja
}

package(){
    cd "${srcdir}"/${pkgname}-${pkgver}/build

    DESTDIR="$pkgdir/" ninja install
}
