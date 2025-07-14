# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer-plugins
pkgver=3.4.1
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
    'libchamplain'
)
optdepends=(
    'libchamplain: Map plugin'
)
provides=($pkgname)
conflicts=('xviewer-plugins-git')
url='https://github.com/linuxmint/xviewer-plugins'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('02dfa3413f5511f6cadc7b9aa373a597')

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
