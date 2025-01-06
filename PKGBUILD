# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>
# Maintainer: Uffe Jakobsen <uffe at uffe dot org>
# Contributor: oldNo.7 <oldNo.7@archlinux.org>

pkgname=catapult
pkgver=1.1
pkgrel=2
pkgdesc="App launcher for Linux, similar to ulauncher(wayland support)"
arch=('any')
url="https://otsaloma.io/catapult "
license=('GPL 3.0')
makedepends=('python-setuptools')
depends=('python' 'glib2' 'gtk4' 'python-gobject' 'libkeybinder3' 'gettext' 'libqalculate' 'pango')
source=("$pkgname-$pkgver.tar.xz::https://github.com/otsaloma/catapult/archive/refs/tags/${pkgver}.tar.gz"
        "$pkgname.patch")
sha256sums=('63b7898b58ea60bd66233bc82a207f1670adab1946c7be493ea5dfd0913720ad'
            '32d6c7fcaea415c6c463f2649e794007f5e3c34e2e493b2bb7786920fd4cff24')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    git apply $srcdir/$pkgname.patch
    make build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr/local install
}
