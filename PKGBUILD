# Maintainer:  Aleksana QwQ <me@aleksana.moe>

pkgname=elementary-store-monitor-git
pkgver=0.14.0.ci3.r4.g37f7ca1
pkgrel=1
pkgdesc="Manage processes and monitor system resources"
url="https://github.com/stsdc/monitor"
arch=(x86_64)
license=(GPL3)
depends=(libhandy gtk3 libwnck3 libgtop wingpanel udisks2 libxnvctrl)
makedepends=(vala meson sassc)
conflicts=(pantheon-system-monitor-git)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $srcdir/$pkgname/subprojects/stylesheet
    git submodule init
    git submodule update
}

build() {
    cd $srcdir/$pkgname
    meson builddir --prefix=/usr -Dindicator-wingpanel=enabled
}

package() {
    cd $srcdir/$pkgname
    meson install -C builddir --destdir "$pkgdir"
}
