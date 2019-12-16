# Maintainer: German Lashevich <german.lashevich@gmail.com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

_i3ipcpp_ver=0.5

pkgname=xkb-switch-i3
pkgver=1.6.1
pkgrel=1
pkgdesc='Program that allows to query and change the XKB layout state (with i3wm auto-switch mode)'
conflicts=('xkb-switch')
provides=('xkb-switch')
arch=('i686' 'x86_64')
url='https://github.com/zebradil/xkb-switch-i3'
license=('GPL3')
depends=('libx11' 'libxkbfile' 'i3-wm' 'libsigc++' 'jsoncpp')
makedepends=('git' 'cmake')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/zebradil/${pkgname}/archive/${pkgver}.tar.gz"
    "i3ipcpp-${_i3ipcpp_ver}.tar.gz::https://github.com/drmgc/i3ipcpp/archive/v${_i3ipcpp_ver}.tar.gz"
)
sha1sums=('eb33343dcb52757240539bd72ef053611c5e5b3c'
          '4022aa1c0c14519c3c5f9b7e82d82fa503b4959c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mv -T "${srcdir}/i3ipcpp-${_i3ipcpp_ver}" ./i3ipc++
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
