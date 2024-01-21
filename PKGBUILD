# Maintainer: German Lashevich <german.lashevich@gmail.com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=xkb-switch-i3
pkgver=2.0.1+i3_5
pkgrel=9
pkgdesc='Program that allows to query and change the XKB layout state (with i3wm auto-switch mode)'
url='https://github.com/zebradil/xkb-switch-i3'
arch=(i686 x86_64)
license=(MIT)
install=''
depends=(i3-wm jsoncpp libsigc++ libx11 libxkbfile)
makedepends=(cmake git i3-wm libsigc++ libx11 libxkbfile)
conflicts=(xkb-switch)
provides=(xkb-switch)
source=(xkb-switch-i3-2.0.1+i3_5.tar.gz::https://github.com/zebradil/xkb-switch-i3/archive/2.0.1+i3-5.tar.gz i3ipcpp-1bf594d1f25e63122c6f92c2a61a848b45457e08.tar.gz::https://api.github.com/repos/drmgc/i3ipcpp/tarball/1bf594d1f25e63122c6f92c2a61a848b45457e08)
build () 
{ 
    set -eo pipefail;
    cd "${srcdir}/${pkgname}-${pkgver//[_+]/-}";
    mv -T "${srcdir}"/drmgc-i3ipcpp-* ./i3ipc++;
    cmake -DCMAKE_INSTALL_PREFIX=/usr .;
    make
}
package () 
{ 
    set -eo pipefail;
    cd "${srcdir}/${pkgname}-${pkgver//[_+]/-}";
    make DESTDIR="$pkgdir/" install
}
sha256sums=('43e9e54ab9177db9f0b2050c1e1091eabaf8c023c39ef2d9450cc9675078a8b1'
            'c2204fc1d0e7e0b7870e74dcfdea3a2d5edc53b8e55a23d046608021f3f3e9c0')
