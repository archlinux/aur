# Maintainer: zlsun <zlsun1995 at gmail dot com>
# Contributor: yetist <yetist@gmail.com>

pkgname=lunar-date
pkgver=2.9.3
pkgrel=1
pkgdesc="Chinese lunar date library."
arch=("i686" "x86_64")
url="http://code.google.com/p/liblunar/"
license=('GPL2')
depends=('glib2>=2.12')
makedepends=('gtk-doc' 'ninja' 'meson' 'gobject-introspection')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yetist/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('d3da98793d04debde54c50e62e8a6b44')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson build --prefix /usr -Denable_gtk_doc=true -Dwith_introspection=true -Dwith_vala=true -Denable_tests=true
    ninja -C build/
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="${pkgdir}" ninja install
}
