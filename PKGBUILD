# Maintainer: German Lashevich <german.lashevich@gmail.com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=xkb-switch-i3-git
pkgver=2.0.1+i3_5
pkgrel=6
pkgdesc='Program that allows to query and change the XKB layout state (with i3wm auto-switch mode)'
url='https://github.com/zebradil/xkb-switch-i3'
arch=(i686 x86_64)
license=(MIT)
install=''
depends=(i3-wm jsoncpp libsigc++ libx11 libxkbfile)
makedepends=(cmake git i3-wm libsigc++ libx11 libxkbfile)
conflicts=(xkb-switch xkb-switch-i3)
provides=(xkb-switch)
source=(git+https://github.com/zebradil/xkb-switch-i3.git#branch=master git+https://github.com/drmgc/i3ipcpp.git)
sha256sums=(SKIP SKIP)
build () 
{ 
    set -eo pipefail;
    cd "${srcdir}/${pkgname%-git}";
    git submodule init;
    git config "submodule.i3ipc++.url" "${srcdir}/i3ipcpp";
    git -c protocol.file.allow=always submodule update;
    cmake -DCMAKE_INSTALL_PREFIX=/usr .;
    make
}
package () 
{ 
    set -eo pipefail;
    cd "${srcdir}/${pkgname%-git}";
    make DESTDIR="$pkgdir/" install
}
