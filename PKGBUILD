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
sha256sums=('146453c963f1f316151857e4e00537eded035158c0b00b66c9955d704c4d4df1')
prepare() {
    cd $_gitname-$pkgver/
    find -name '*.py' -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

package() {
    cd $_gitname-$pkgver/
    python2 setup.py install --root="$pkgdir"
}
