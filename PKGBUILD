# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Shimi Chen <shimi.chen@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: LookTJ/Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: alessandro_ufms
# Contributer: Bluthund <bluthund23@gmail.com>

pkgname=caffeine-systray
_gitname=caffeine-ng
pkgver=2.5
pkgrel=1
# epoch was already set to 1 when I adopted it.
epoch=1
pkgdesc="Fork of caffeine that maintains systray support."
arch=(any)
url=https://github.com/hobarrera/$_gitname
license=(GPL3)
depends=(dconf gtk2 hicolor-icon-theme kaa-metadata python2-dbus
         python2-gobject python2-notify python2-xdg python2-xlib)
conflicts=(caffeine caffeine-bzr caffeine-oneclick)
provides=(caffeine caffeine-bzr caffeine-oneclick)
replaces=(caffeine-oneclick)
makedepends=(git)
options=(!emptydirs !libtool)
install=$pkgname.install
source=(https://github.com/hobarrera/$_gitname/archive/v$pkgver.zip)
sha256sums=('c7e61cfc7ad66bf34b9c8159a4d7b5b3356b69e6f6e75e103ec5cc1c7c585cd4')

prepare() {
    cd $_gitname-$pkgver/
    find -name '*.py' -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

package() {
    cd $_gitname-$pkgver/
    python2 setup.py install --root="$pkgdir"
}
