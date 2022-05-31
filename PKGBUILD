# Maintainer: German Lashevich <german.lashevich@gmail.com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

_i3ipcpp_ver=7c2f465cbb1ad502d96820c022b2f649be413ccc

pkgname=xkb-switch-i3
pkgver=1.8.5+i3_4
pkgrel=2
pkgdesc='Program that allows to query and change the XKB layout state (with i3wm auto-switch mode)'
conflicts=('xkb-switch')
provides=('xkb-switch')
arch=('i686' 'x86_64')
url='https://github.com/zebradil/xkb-switch-i3'
license=('GPL3')
depends=('libx11' 'libxkbfile' 'i3-wm' 'libsigc++' 'jsoncpp')
makedepends=('git' 'cmake')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/zebradil/${pkgname}/archive/${pkgver//_/-}.tar.gz"
    "i3ipcpp-${_i3ipcpp_ver}.tar.gz::https://api.github.com/repos/drmgc/i3ipcpp/tarball/${_i3ipcpp_ver}"
)
# Old approach, reactivate when a new version of i3ipcpp is released
# "i3ipcpp-${_i3ipcpp_ver}.tar.gz::https://github.com/drmgc/i3ipcpp/archive/v${_i3ipcpp_ver}.tar.gz"
sha1sums=('84546b91823a7ba2fd4d01ca33637c1a2b67eaaf'
          '54a3e7cd00e457d9bfb443fdd4046f2b19170815')

build() {
    cd "${srcdir}/${pkgname}-${pkgver//[_+]/-}"
    # Old approach, reactivate when a new version of i3ipcpp is released
    # mv -T "${srcdir}/i3ipcpp-${_i3ipcpp_ver}" ./i3ipc++
    mv -T "${srcdir}"/drmgc-i3ipcpp-* ./i3ipc++
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver//[_+]/-}"
    make DESTDIR="$pkgdir/" install
}
